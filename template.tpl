___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "mbuzz — Server-Side Attribution",
  "brand": {
    "id": "brand_mbuzz",
    "displayName": "mbuzz",
    "thumbnail": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCI+CiAgPCEtLSBCYWNrZ3JvdW5kIHdpdGggcm91bmRlZCBjb3JuZXJzIC0tPgogIDxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiByeD0iMTYiIHJ5PSIxNiIgZmlsbD0iI0Q5M0YyQiIvPgoKICA8IS0tIE0gd2l0aCBkZWNvcmF0aXZlIHN3YXNoIHRhaWwgLSBzY2FsZWQgZG93biAtLT4KICA8ZyBmaWxsPSIjRkZFQ0I0Ij4KICAgIDwhLS0gTWFpbiBNIGJvZHkgLS0+CiAgICA8cGF0aCBkPSIKICAgICAgTSAxOCAxOAogICAgICBDIDE4IDE0LCAyMCAxMiwgMjQgMTIKICAgICAgTCAzNCAxMgogICAgICBDIDM4IDEyLCA0MCAxNCwgNDIgMTgKICAgICAgTCA1MCA0MgogICAgICBMIDU4IDE4CiAgICAgIEMgNjAgMTQsIDYyIDEyLCA2NiAxMgogICAgICBMIDc2IDEyCiAgICAgIEMgODAgMTIsIDgyIDE0LCA4MiAxOAogICAgICBMIDgyIDcyCiAgICAgIEMgODIgNzYsIDgwIDc4LCA3NiA3OAogICAgICBMIDcyIDc4CiAgICAgIEMgNjggNzgsIDY2IDc2LCA2NiA3MgogICAgICBMIDY2IDM4CiAgICAgIEwgNTYgNTgKICAgICAgQyA1NCA2MiwgNTIgNjQsIDUwIDY0CiAgICAgIEMgNDggNjQsIDQ2IDYyLCA0NCA1OAogICAgICBMIDM0IDM4CiAgICAgIEwgMzQgNzIKICAgICAgQyAzNCA3NiwgMzIgNzgsIDI4IDc4CiAgICAgIEwgMjQgNzgKICAgICAgQyAyMCA3OCwgMTggNzYsIDE4IDcyCiAgICAgIFoKICAgICIvPgoKICAgIDwhLS0gRGVjb3JhdGl2ZSBzd2FzaC9jdXJsIC0tPgogICAgPHBhdGggZD0iCiAgICAgIE0gNjYgNTYKICAgICAgQyA2NiA1NiwgNjggNTgsIDcyIDYyCiAgICAgIEMgNzggNjgsIDg0IDc2LCA4NCA4NAogICAgICBDIDg0IDkyLCA3NiA5OCwgNjYgOTgKICAgICAgQyA1OCA5OCwgNTQgOTQsIDU2IDg4CiAgICAgIEMgNTggODQsIDYyIDg1LCA2NiA4NQogICAgICBDIDcyIDg1LCA3NiA4MiwgNzYgNzgKICAgICAgQyA3NiA3NCwgNzIgNzAsIDY2IDY4CiAgICAgIFoKICAgICIvPgogIDwvZz4KPC9zdmc+Cg=="
  },
  "description": "Send pageviews, events, conversions, and identity data to mbuzz for multi-touch marketing attribution. Works with any website using server-side GTM.",
  "categories": ["ANALYTICS", "ATTRIBUTION"],
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [
      { "type": "NON_EMPTY" }
    ],
    "help": "Your mbuzz API key. Find it in your mbuzz dashboard under Settings → API Keys. Starts with sk_live_ or sk_test_."
  },
  {
    "type": "SELECT",
    "name": "callType",
    "displayName": "Call Type",
    "selectItems": [
      { "value": "session", "displayValue": "Session — track page views and create sessions" },
      { "value": "event", "displayValue": "Event — track custom events" },
      { "value": "conversion", "displayValue": "Conversion — track conversions for attribution" },
      { "value": "identify", "displayValue": "Identify — link visitor to a known user" }
    ],
    "simpleValueType": true,
    "valueValidators": [
      { "type": "NON_EMPTY" }
    ],
    "help": "Choose what type of data this tag sends to mbuzz."
  },
  {
    "type": "TEXT",
    "name": "eventType",
    "displayName": "Event / Conversion Type",
    "simpleValueType": true,
    "help": "For Event tags: the event name (e.g. form_submit, add_to_cart). For Conversion tags: the conversion type (e.g. purchase, signup, lead).",
    "enablingConditions": [
      { "paramName": "callType", "paramValue": "event", "type": "EQUALS" },
      { "paramName": "callType", "paramValue": "conversion", "type": "EQUALS" }
    ]
  },
  {
    "type": "TEXT",
    "name": "revenue",
    "displayName": "Revenue",
    "simpleValueType": true,
    "help": "Revenue amount for this conversion. Use a GTM variable like {{Revenue}} for dynamic values.",
    "enablingConditions": [
      { "paramName": "callType", "paramValue": "conversion", "type": "EQUALS" }
    ]
  },
  {
    "type": "TEXT",
    "name": "currency",
    "displayName": "Currency",
    "simpleValueType": true,
    "defaultValue": "USD",
    "help": "ISO 4217 currency code (e.g. USD, EUR, GBP). Default: USD.",
    "enablingConditions": [
      { "paramName": "callType", "paramValue": "conversion", "type": "EQUALS" }
    ]
  },
  {
    "type": "TEXT",
    "name": "userId",
    "displayName": "User ID",
    "simpleValueType": true,
    "valueValidators": [
      { "type": "NON_EMPTY" }
    ],
    "help": "The known user ID from your CRM, auth system, or database. Use a GTM variable.",
    "enablingConditions": [
      { "paramName": "callType", "paramValue": "identify", "type": "EQUALS" }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "customProperties",
    "displayName": "Custom Properties",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "help": "Additional key-value properties. Use GTM variables for dynamic values. For Identify tags, these become user traits.",
    "enablingConditions": [
      { "paramName": "callType", "paramValue": "event", "type": "EQUALS" },
      { "paramName": "callType", "paramValue": "conversion", "type": "EQUALS" },
      { "paramName": "callType", "paramValue": "identify", "type": "EQUALS" }
    ]
  },
  {
    "type": "GROUP",
    "name": "advancedSettings",
    "displayName": "Advanced Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "apiUrl",
        "displayName": "API URL",
        "simpleValueType": true,
        "defaultValue": "https://mbuzz.co/api/v1",
        "help": "Override the API endpoint. Only change this for testing or self-hosted deployments."
      },
      {
        "type": "TEXT",
        "name": "cookieDomain",
        "displayName": "Cookie Domain",
        "simpleValueType": true,
        "help": "Override the cookie domain. Leave blank to auto-detect from your site's domain."
      },
      {
        "type": "TEXT",
        "name": "cookiePath",
        "displayName": "Cookie Path",
        "simpleValueType": true,
        "defaultValue": "/",
        "help": "Cookie path. Default is / (all pages)."
      },
      {
        "type": "CHECKBOX",
        "name": "debug",
        "checkboxText": "Enable debug logging",
        "simpleValueType": true,
        "help": "Log all requests and responses to the sGTM console. Disable in production."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

// mbuzz — Server-Side Attribution Tag Template
// https://github.com/mbuzzco/mbuzz-sgtm
// Version: 1.0.0

var sendHttpRequest = require('sendHttpRequest');
var getCookieValues = require('getCookieValues');
var setCookie = require('setCookie');
var getRemoteAddress = require('getRemoteAddress');
var getRequestHeader = require('getRequestHeader');
var sha256 = require('sha256');
var getEventData = require('getEventData');
var logToConsole = require('logToConsole');
var JSON = require('JSON');
var getTimestampMillis = require('getTimestampMillis');
var generateRandom = require('generateRandom');
var makeString = require('makeString');
var makeNumber = require('makeNumber');
var computeEffectiveTldPlusOne = require('computeEffectiveTldPlusOne');

var COOKIE_NAME = '_mbuzz_vid';
var COOKIE_MAX_AGE = 63072000; // 2 years in seconds
var TAG_VERSION = '1.0.0';
var DEFAULT_API_URL = 'https://mbuzz.co/api/v1';

// ---------------------------------------------------------------------------
// Visitor ID: read from cookie or generate new
// ---------------------------------------------------------------------------

function resolveVisitorId(callback) {
  var cookies = getCookieValues(COOKIE_NAME);
  if (cookies && cookies.length > 0 && cookies[0]) {
    callback(cookies[0]);
    return;
  }

  // Generate a new 64-char hex visitor ID via SHA-256
  var seed = makeString(getTimestampMillis()) +
    makeString(generateRandom(0, 2147483647)) +
    (getRemoteAddress() || 'no-ip');
  sha256(seed, function(hash) {
    callback(hash);
  }, {outputEncoding: 'hex'});
}

// ---------------------------------------------------------------------------
// Cookie: set/refresh the _mbuzz_vid cookie
// ---------------------------------------------------------------------------

function refreshCookie(visitorId) {
  var pageHost = getEventData('page_hostname') || getRequestHeader('host') || '';
  var domain = data.cookieDomain;

  if (!domain && pageHost) {
    domain = computeEffectiveTldPlusOne(pageHost);
  }

  var options = {
    path: data.cookiePath || '/',
    'max-age': COOKIE_MAX_AGE,
    secure: true,
    httpOnly: true,
    sameSite: 'lax'
  };

  if (domain) {
    options.domain = domain;
  }

  setCookie(COOKIE_NAME, visitorId, options);
}

// ---------------------------------------------------------------------------
// Device fingerprint: SHA256(ip|user_agent)[0:32]
// ---------------------------------------------------------------------------

function computeFingerprint(callback) {
  var ip = getRemoteAddress();
  var ua = getRequestHeader('user-agent');

  if (!ip || !ua) {
    callback(null);
    return;
  }

  sha256(ip + '|' + ua, function(hash) {
    callback(hash.substring(0, 32));
  }, {outputEncoding: 'hex'});
}

// ---------------------------------------------------------------------------
// Custom properties: build from the key-value table
// ---------------------------------------------------------------------------

function buildProperties() {
  var props = {};
  if (data.customProperties) {
    for (var i = 0; i < data.customProperties.length; i++) {
      var row = data.customProperties[i];
      if (row.key && row.value) {
        props[row.key] = row.value;
      }
    }
  }
  return props;
}

function hasProperties(props) {
  for (var key in props) {
    if (props.hasOwnProperty(key)) return true;
  }
  return false;
}

// ---------------------------------------------------------------------------
// HTTP: send request to mbuzz API
// ---------------------------------------------------------------------------

function send(path, body) {
  var apiUrl = data.apiUrl || DEFAULT_API_URL;
  var url = apiUrl + path;
  var bodyStr = JSON.stringify(body);

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + data.apiKey,
    'User-Agent': 'mbuzz-sgtm/' + TAG_VERSION
  };

  if (data.debug) {
    logToConsole('[mbuzz] ' + data.callType + ' → ' + url);
    logToConsole('[mbuzz] body: ' + bodyStr);
  }

  sendHttpRequest(url, function(statusCode, responseHeaders, responseBody) {
    if (data.debug) {
      logToConsole('[mbuzz] response: ' + makeString(statusCode));
      if (statusCode >= 400) {
        logToConsole('[mbuzz] error: ' + responseBody);
      }
    }

    if (statusCode >= 200 && statusCode < 300) {
      data.gtmOnSuccess();
    } else {
      data.gtmOnFailure();
    }
  }, {headers: headers, method: 'POST', timeout: 5000}, bodyStr);
}

// ---------------------------------------------------------------------------
// Call type handlers
// ---------------------------------------------------------------------------

function handleSession(visitorId) {
  var ua = getRequestHeader('user-agent');

  computeFingerprint(function(fingerprint) {
    var body = {
      session: {
        visitor_id: visitorId,
        url: getEventData('page_location') || '',
        referrer: getEventData('page_referrer') || ''
      }
    };

    if (fingerprint) {
      body.session.device_fingerprint = fingerprint;
    }
    if (ua) {
      body.session.user_agent = ua;
    }

    send('/sessions', body);
  });
}

function handleEvent(visitorId) {
  var ip = getRemoteAddress();
  var ua = getRequestHeader('user-agent');

  var eventObj = {
    event_type: data.eventType || getEventData('event_name') || 'custom_event',
    visitor_id: visitorId
  };

  if (ip) eventObj.ip = ip;
  if (ua) eventObj.user_agent = ua;

  var props = buildProperties();
  var pageUrl = getEventData('page_location');
  if (pageUrl) props.url = pageUrl;
  eventObj.properties = props;

  send('/events', {events: [eventObj]});
}

function handleConversion(visitorId) {
  var ip = getRemoteAddress();
  var ua = getRequestHeader('user-agent');

  var conversionObj = {
    visitor_id: visitorId,
    conversion_type: data.eventType || 'conversion',
    currency: data.currency || 'USD'
  };

  if (ip) conversionObj.ip = ip;
  if (ua) conversionObj.user_agent = ua;
  if (data.revenue) conversionObj.revenue = makeNumber(data.revenue);

  var props = buildProperties();
  if (hasProperties(props)) conversionObj.properties = props;

  send('/conversions', {conversion: conversionObj});
}

function handleIdentify(visitorId) {
  var body = {
    user_id: data.userId || '',
    visitor_id: visitorId
  };

  var traits = buildProperties();
  if (hasProperties(traits)) body.traits = traits;

  send('/identify', body);
}

// ---------------------------------------------------------------------------
// Main execution
// ---------------------------------------------------------------------------

resolveVisitorId(function(visitorId) {
  refreshCookie(visitorId);

  if (data.callType === 'session') {
    handleSession(visitorId);
  } else if (data.callType === 'event') {
    handleEvent(visitorId);
  } else if (data.callType === 'conversion') {
    handleConversion(visitorId);
  } else if (data.callType === 'identify') {
    handleIdentify(visitorId);
  } else {
    if (data.debug) {
      logToConsole('[mbuzz] unknown call type: ' + data.callType);
    }
    data.gtmOnFailure();
  }
});


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_mbuzz_vid"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_mbuzz_vid"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.
