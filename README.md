# mbuzz — Server-Side GTM Tag Template

Multi-touch marketing attribution for any website using server-side Google Tag Manager.

## What this does

This tag template runs inside your sGTM container and sends visitor, session, event, conversion, and identity data to [mbuzz](https://mbuzz.co) for multi-touch attribution. It's the sGTM equivalent of our server-side SDKs (Ruby, Node, Python, PHP).

**No backend code needed.** Works with Webflow, WordPress, Squarespace, and any site with GTM.

## How it works

1. **Visitor ID** — Reads or creates a `_mbuzz_vid` cookie (first-party, 2-year expiry, HttpOnly)
2. **Device fingerprint** — Computes `SHA256(ip|user_agent)` for session resolution
3. **API calls** — Sends data to mbuzz's REST API (same endpoints the server-side SDKs use)

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

## Setup

You need to create **one tag per call type**. mbuzz uses a 4-call model:

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
| Tag Sequencing | Fire `mbuzz - Session` before this tag |

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
| Tag Sequencing | Fire `mbuzz - Session` before this tag |

### 4. Identify tag (optional)

Links an anonymous visitor to a known user from your CRM or auth system.

| Field | Value |
|-------|-------|
| API Key | `sk_live_your_key_here` |
| Call Type | Identify |
| User ID | `{{User ID}}` (GTM variable) |
| Trigger | Login or signup event |
| Tag Sequencing | Fire `mbuzz - Session` before this tag |

## Tag sequencing

**The Session tag must fire before any other mbuzz tag.** Without it, mbuzz doesn't know who the visitor is, and events/conversions will be rejected.

For each Event, Conversion, and Identify tag:
1. Edit the tag → **Advanced Settings** → **Tag Sequencing**
2. Check **"Fire a tag before this tag fires"**
3. Select `mbuzz - Session`

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

## Documentation

Full setup guide with diagrams: [mbuzz.co/docs/integrations-sgtm](https://mbuzz.co/docs/integrations-sgtm)

## License

MIT — see [LICENSE](LICENSE)
