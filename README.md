# mbuzz — Server-Side GTM Tag Template

Multi-touch marketing attribution for any website using server-side Google Tag Manager. No backend code needed.

Client-side tracking loses 30–40% of marketing data to ad blockers and 7-day cookie caps. This tag template runs inside your sGTM container, where requests flow through your own domain as first-party cookies with a 2-year expiry — so you see the full customer journey.

> **[Full setup guide with screenshots →](https://mbuzz.co/docs/integrations-sgtm)**
>
> Covers sGTM infrastructure, client-side GTM installation, CMS-specific instructions (Webflow, WordPress, Squarespace), and end-to-end testing.

## Prerequisites

This template is one piece of a 3-part setup. You need:

1. **Client-side GTM** — the standard JS snippet on your site, configured to send data to your sGTM server
2. **An sGTM server** — [Stape.io](https://stape.io) (~$10/mo), Addingwell, or Google Cloud
3. **This tag template** — installed in your sGTM container (instructions below)

If you don't have parts 1 and 2 yet, start with the **[full integration guide](https://mbuzz.co/docs/integrations-sgtm)**.

## Link your web container to the server container

Before installing tags, you need to route your web container's GA4 data stream through your sGTM server. Without this step, no data reaches server-side GTM.

1. Open your **web** GTM container (not the server container)
2. Find the **Google Tag** (GA4 Configuration tag)
3. Under **Configuration settings**, click **Add Row**
4. Set the parameter name to `server_container_url`
5. Set the value to your sGTM URL (e.g. `https://sgtm.yourdomain.com`)
6. **Save** the tag and **publish** the web container

## How it works

1. **Visitor ID** — Reads or creates a `_mbuzz_vid` cookie (first-party, 2-year expiry, HttpOnly)
2. **Device fingerprint** — Computes `SHA256(ip|user_agent)` for cross-session resolution
3. **Channel classification** — Automatically categorizes traffic (organic search, paid social, email, direct, etc.)
4. **API calls** — Sends data to mbuzz's REST API (same endpoints the server-side SDKs use)
5. **Consent** — Respects CMP consent settings automatically

## Installation

### From the GTM Community Template Gallery

1. Open your **server-side** GTM container
2. Go to **Templates** → **Tag Templates** → **Search Gallery**
3. Search for **"mbuzz"**
4. Click **Add to workspace** → **Add**

### Manual import

1. Download `template.tpl` from this repository
2. In your sGTM container: **Templates** → **New** → **Import**
3. Select the `template.tpl` file

## Tag configuration

Create **one tag per call type**. mbuzz uses a 4-call model:

### 1. Session tag (required)

Fires on every page view. Creates visitors and sessions with UTM/referrer/channel attribution.

| Field | Value |
|-------|-------|
| API Key | `sk_live_your_key_here` |
| Call Type | Session |
| Trigger | All Pages (Page View) |

### 2. Event tag (optional)

Tracks mid-funnel actions like form submissions, button clicks, video plays.

| Field | Value |
|-------|-------|
| API Key | `sk_live_your_key_here` |
| Call Type | Event |
| Event Type | `form_submit` (your event name) |
| Trigger | Your custom event trigger |

### 3. Conversion tag (required for attribution)

Tracks conversions and triggers multi-touch attribution calculation.

| Field | Value |
|-------|-------|
| API Key | `sk_live_your_key_here` |
| Call Type | Conversion |
| Conversion Type | `purchase` (your conversion name) |
| Revenue | `{{Revenue}}` (optional, use GTM variable) |
| Currency | `USD` (default) |
| Trigger | Your conversion event trigger |

### 4. Identify tag (optional)

Links an anonymous visitor to a known user from your CRM or auth system.

| Field | Value |
|-------|-------|
| API Key | `sk_live_your_key_here` |
| Call Type | Identify |
| User ID | `{{User ID}}` (GTM variable) |
| Trigger | Login or signup event |

## How the Session tag and visitor ID work

**The Session tag must fire on every page view** using an **All Pages** trigger. It creates the `_mbuzz_vid` cookie that identifies the visitor.

Event, Conversion, and Identify tags read the same `_mbuzz_vid` cookie automatically. As long as the visitor has loaded at least one page (which sets the cookie), subsequent tags will have the visitor ID they need. For events that fire on the same page as the initial page view (e.g. form submissions), the cookie is already set from the page view, so no special ordering is required.

## Advanced settings

| Setting | Default | Description |
|---------|---------|-------------|
| API URL | `https://mbuzz.co/api/v1` | Override for testing or self-hosted |
| Cookie Domain | (auto-detect) | Override cookie domain |
| Cookie Path | `/` | Cookie path |
| Debug | Off | Log requests/responses to sGTM console |

## Testing

1. Use a `sk_test_*` API key during testing (test data is separate from production)
2. In your sGTM container, click **Preview** → enter your website URL
3. Visit your site, browse pages, trigger events
4. Check the GTM preview panel for green checkmarks on mbuzz tags
5. Check your mbuzz dashboard for incoming data
6. When ready, switch to `sk_live_*` and click **Submit** to publish

## API endpoints

The tag calls these mbuzz API endpoints (same as the server-side SDKs):

| Call Type | Endpoint | Payload |
|-----------|----------|---------|
| Session | `POST /api/v1/sessions` | `{session: {visitor_id, url, referrer, device_fingerprint}}` |
| Event | `POST /api/v1/events` | `{events: [{event_type, visitor_id, ip, user_agent, properties}]}` |
| Conversion | `POST /api/v1/conversions` | `{conversion: {visitor_id, conversion_type, revenue, currency, ip, user_agent, properties}}` |
| Identify | `POST /api/v1/identify` | `{user_id, visitor_id, traits}` |

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Tags fire but no data in dashboard | Verify you're using the **sGTM** container, not client-side GTM |
| Events/conversions rejected | Ensure the Session tag has an **All Pages** trigger so it fires on every page view and sets the `_mbuzz_vid` cookie |
| Cookie not being set | Confirm your sGTM domain matches your website's root domain over HTTPS |
| Unsure about response codes | Enable **Debug** mode in Advanced Settings to log requests to the sGTM console |

See the **[full guide](https://mbuzz.co/docs/integrations-sgtm)** for more details.

## License

MIT — see [LICENSE](LICENSE)
