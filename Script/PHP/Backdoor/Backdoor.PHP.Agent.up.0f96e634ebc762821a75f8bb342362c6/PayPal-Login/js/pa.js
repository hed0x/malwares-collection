(function () {
  "use strict";
  // namespaces
  var PAYPAL = window.PAYPAL || {};
  window.PAYPAL = PAYPAL;
  PAYPAL.analytics = {};
  window.fpti = window.fpti || {};
  window.fptiserverurl = window.fptiserverurl || '//t.paypal.com/ts';

   // constructor
   PAYPAL.analytics.Analytics = function (options) {
                this._init(options);
   };

   PAYPAL.analytics.Analytics.prototype = {

                // analytics version
                version: '0.1',

                // options
                options: {
                       click: {
                             elements: '*[data-pp-click]',
                             onClick: function () {},
                             request: {
                                    keys: {
                                           linkUrl: 'lu'
                                    },
                                    values: {
                                           eventType: 'cl'
                                    }
                             }
                       },
                       formAbandonment: {
                             elements: 'form',
                             request: {
                                    keys: {
                                           lastFormFocused: 'lf',
                                           lastInputFocused: 'li'
                                    },
                                    values: {
                                           eventType: 'fa'
                                    }
                             }
                       },
                       impression: {
                             request: {
                                    keys: {
                                           cookiesEnabled: 'ce',
                                           plugins: 'pl',
                                           jsVersion: 'jsv',
                                           pageTitle: 'pt',
                                           referrer: 'ru',
                                           screenColorDepth: 'cd',
                                           screenWidth: 'sw',
                                           screenHeight: 'sh',
                                           browserWidth: 'bw',
                                           browserHeight: 'bh'
                                    },
                                    values: {
                                           eventType: 'im'
                                    }
                             }
                       },
                       request: {
                             data: {}, // custom data
                             unloadDelay: false, // set this to an integer in ms to delay unload to beat race condition
                             keys: { // these default params will be prefixed with the prefix
                                    version: 'v',
                                    timestamp: 't',
                                    gmtOffset: 'g',
                                    eventType: 'e'
                             },
                             values: {
                                    eventType: 'na',
                                    'true': 1,
                                    'false': 0
                             },
                             keyPrefix: '', // the prefix to be used for system variable keys in the query string
                             url: '//t.paypal.com/ts',
                             onBeaconCreate: function () {}
                       }
                },
                _delayUnloadUntil: null, // the browser will not unload until this timestamp is met
                _lastFormFocused: null, // the last form that was focused on
                _lastInputFocused: null, // the last input that was focused on

                // constructor
                _init: function (options) {
                       // set options
                       this.setOptions(options);

                       // add unload delay listener
                       this._enableUnloadDelay();
                },

                // merges two options objects
                _mergeOptions: function (options1, options2) {
                       // convert data query string to object if needed
                       if (options1 && options1.data && typeof options1.data === 'string') {
                             options1.data = this.utils.queryStringToObject(options1.data);
                       }
                       if (options2 && options2.data && typeof options2.data === 'string') {
                             options2.data = this.utils.queryStringToObject(options2.data);
                       }

                       // merge one time options
                       var options = this.utils.merge(options1, options2);

                       return options;
                },

                _enableUnloadDelay: function () {
                       var self = this,
                             delay = function () {
                             var now;

                             // lock browser until delay is met
                             if (self._delayUnloadUntil) {
                                    do {
                                           now = new Date();
                                    } while (now.getTime() < self._delayUnloadUntil);
                             }
                       };
                       this.utils.removeListener(window, 'beforeunload', delay);
                       this.utils.addListener(window, 'beforeunload', delay);
                },

                // fires a tracking event with the prefix prepended to all event datas
                // note: this is only used for predefined events like impression, click, etc
                _recordEvent: function (eventData, options) {



                       var key;
                                             options = this._mergeOptions(this.options.request, options);
                       // ensure data is set
                       options.data = options.data || {};



                       // prepend prefix to all event data keys and add event data to options.data
                       for (key in eventData) {
                             options.data[options.keyPrefix + key] = eventData[key];
                       }

                       // record this event
                       this.record(options);
                },

                // makes tracking record request
                _request: function (options) {
                       this._createBeacon(options);
                },

                // creates an image tag for sending a tracking request to the server
                _createBeacon: function (options) {

               var self = this,
                             beacon = new Image();
                       if (options.onBeaconCreate(beacon) !== false) {
                             beacon.src = this._generateBeaconUrl(options);

                             // unload delay (browser lock)
                             if (options.unloadDelay) {
                                    this.setUnloadDelay(options.unloadDelay);
                             }
                       }
                },

                // generates a beacon url given request options
                _generateBeaconUrl: function (options) {
                       var parts = options.url.split('?'),
                             // remove existing query string
                             url = parts[0],
                             optKeys = options.keys,    //caching the keys
                             key, perfData,
                             rLogId, tempFpti=window.fpti.constructor();

             var tempFpti = window.fpti.constructor();

             // deep clone
             for (key in window.fpti) {
              tempFpti[key] = window.fpti[key];
                       }

                       // if url begins with '//' then we automatically add the current protocol


                       if (url.match(/^\/\//)) {
                             url = window.location.protocol + url;
                       }

                       // add query string delimiter
                       url += '?';

                       // reappend existing query string
                       if (parts[1]) {
                             url += parts[1] + '&';
                       }

                       // append version
                       url += options.keyPrefix + optKeys.version + '=' + encodeURIComponent(this.version);

                       // append timestamp
                       if (optKeys.timestamp) {
                             url = this._appendQueryStringData(url, options.keyPrefix + optKeys.timestamp, this._getTimestamp());
                       }

                       // append gmt offset
                       if (optKeys.gmtOffset) {
                             url = this._appendQueryStringData(url, options.keyPrefix + optKeys.gmtOffset, this._getGmtOffset());
                       }

                       // append type
                       if (optKeys.eventType) {
                             url = this._appendQueryStringData(url, options.keyPrefix + optKeys.eventType, options.values.eventType);
                       }
                       // append the data in options data

                      for (var opt in options.data) {

                 if(opt == 'opic'){
                   var opic = tempFpti[opt] || options.data[opt];
                   opic = opic.replace(/\w+\@\w+\.\w+/g,'');
                   opic = opic.replace(/\d+/g,'');
                   tempFpti[opt] = opic;
                 }
                 else {
                 tempFpti[opt]= tempFpti[opt] || options.data[opt];
                 }
                       }

                       for (key in tempFpti) {
			if(tempFpti[key] !== " ") {
                             url = this._appendQueryStringData(url, key, tempFpti[key]);
                       	}
			}

                       perfData = this._buildPerformanceData(options.data);
                       for (key in perfData) {
                             url = this._appendQueryStringData(url, key, perfData[key]);
		       }
                       rLogId = this._getRLogId();
                       if (rLogId) {
                             url = this._appendQueryStringData(url, "teal", rLogId);
                       }

                       if(typeof(s)=='object' && typeof(s.beacon_url)!='undefined' && s.beacon_url !="")
                        {
                                if (s.beacon_url.split('?')[1]) 
                                {
                                    var scParam =s.beacon_url.split('?')[1];
                                    if (scParam.split('&')) 
                                    {
                                        var scParam_arr = scParam.split('&');
                                        var scParam_json = {};
                                        for(var i = 0; i < scParam_arr.length; i++)
                                        {
                                            var bits = scParam_arr[i].split('=');
                                            scParam_json[bits[0]] = bits[1];
                                        }
                                        scParam_json=JSON.stringify(scParam_json);
                                        var backUpUrl=url;
                                        var limit=8000;
                                        url =url + "&scParams=" +scParam_json;
                                        if(url.length>limit)
                                        {
                                            url = backUpUrl;
                                        }
                                    }
                                }
                        }

                       return url;
                },

                // adds a new piece of data to the query string of a url
                _appendQueryStringData: function (url, key, value) {
                       if ((key || key === 0) && (value || value === 0)) {
                             url += '&' + key + '=' + encodeURIComponent(value);
                       }
                       return url;
                },

                // gets current timestamp in epoch seconds
                _getTimestamp: function () {
                       return new Date().getTime();
                },

                // build the Performance Timing related data
                _buildPerformanceData: function (data) {
                       var perf = {},
                             pgst = data.pgst || 0;
                       if (!PAYPAL.analytics.perf) {
                             if (window.performance) {
                                    var timing = window.performance.timing,
                                           secureConTime = timing.secureConnectionStart || timing.connectEnd,
                                           loadEventEnd = timing.loadEventEnd || timing.loadEventStart;

                                    perf.t1 = this._getPerformanceData( timing.requestStart, timing.fetchStart);  //t1 - DNS+Connection+SSL (t1c + t1d + t1s));
                                    perf.t1c = this._getPerformanceData( timing.connectEnd, timing.fetchStart);  //t1c - Network latency or Connection timing
                                     perf.t1d = this._getPerformanceData( timing.domainLookupEnd, timing.domainLookupStart); //t1d - DNS resolution timing
                                    perf.t1s = this._getPerformanceData( timing.connectEnd, secureConTime);                           //t1s - SSL timing
                                    perf.t2 = this._getPerformanceData( timing.responseStart, timing.requestStart);      //t2 - Server time
                                    perf.t3 = this._getPerformanceData( timing.responseEnd, timing.responseStart);            //t3- Html/Content download time
                                    perf.t4d = this._getPerformanceData( timing.domComplete, timing.domLoading);        //t4d - DOM Timing
                                    perf.t4 = this._getPerformanceData( loadEventEnd, timing.domLoading);                     // t4- Browser process time (t4d + t4e)
                                    perf.t4e = this._getPerformanceData( loadEventEnd, timing.loadEventStart);           //t4e - Event Binding timing
                                    perf.tt = this._getPerformanceData( loadEventEnd, timing.navigationStart);   //tt - The whole process of navigation and page load
                             } else if (pgst) { //Server sets the pgst value (page Load Start Time)
                                    perf.told = new Date().getTime() - pgst; //(t old) t2+t3+t4
                             }
                             PAYPAL.analytics.perf = perf;
                       }
                       return perf;
                },

                _getPerformanceData: function (end, start){
                       var diff = 0;
                       var max = 600000; //10 minutes
                       if(this._validateNumber(start) && this._validateNumber(end)){//Both start & end has to be a valid number
                             if(end >= start){//End should be greater than 0 & bigger or equal to start
                                    diff = end - start;
                                    if(diff > max){//End should not be bigger than max
                                           diff = 0;
                                    }
                             }
                       }
                       return diff;
                },

                //Check for valid number
                _validateNumber: function (value) {
                       if(!value){
                             return false;
                       }
                 if (value.length == 0) {
                     return false;
                 }
                 var intValue = parseInt(value);
                 if (intValue == Number.NaN) {
                     return false;
                 }
                 if (intValue < 0) {
                     return false;
                 }
                 return true;
             },

                //Captures the rLogId from the page
                _getRLogId: function () {
                       var rLogId,
                             commentNode,
                             commentData;
                       if (window.rLogId) {
                             rLogId = window.rLogId;
                       } else {
                             try {
                                    commentNode = [].slice.call(document.head.childNodes).filter(function (node) {
                                           return node.nodeType === 8;
                                    })[0];
                                    commentData = commentNode.data;
                                    if (commentData && commentData.length > 0) {
                                           commentData = commentData.trim().split(" : ");
                                           if (commentData.length > 2) {
                                                  rLogId = commentData[commentData.length - 1];
                                           }
                                    }
                             } catch (e) {}
                       }
                       return rLogId;
                },

                // gets current gmt offset in minutes
                _getGmtOffset: function () {
                       return new Date().getTimezoneOffset();
                },

                // get page title
                _getPageTitle: function () {
                       return document.title;
                },

                // get referrer
                _getReferrer: function () {
                       return document.referrer;
                },

                // gets screen color depth
                _getScreenColorDepth: function () {
                       return window.screen.colorDepth;
                },

                // gets screen dimensions
                _getScreenDimensions: function () {
                       return {
                             width: window.screen.width,
                             height: window.screen.height
                       };
                },

                // gets browser dimensions
                _getBrowserDimensions: function () {
                       // pulled from http://andylangton.co.uk/articles/javascript/get-viewport-size-javascript/
                       var browserWidth,
                             browserHeight,
                             element = document.documentElement;

                       // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
                       if (window.innerWidth !== 'undefined' && window.innerWidth) {
                             browserWidth = window.innerWidth;
                             browserHeight = window.innerHeight;
                       }
                       // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
                       else if (element !== 'undefined' && element.clientWidth !== 'undefined' && element.clientWidth !== 0) {
                             browserWidth = element.clientWidth;
                             browserHeight = element.clientHeight;
                       }
                       // older versions of IE
                       else {
                             element = document.getElementsByTagName('body')[0];
                             browserWidth = element.clientWidth;
                             browserHeight = element.clientHeight;
                       }

                       return {
                             width: browserWidth,
                             height: browserHeight
                       };
                },

                // gets boolean for java enabled
                _getJavaEnabled: function (options) {
                       options = this._mergeOptions(this.options.request, options);
                       return (navigator.javaEnabled()) ? options.values['true'] : options.values['false'];
                },

                // gets boolean for cookies enabled
                _getCookiesEnabled: function (options) {
                       options = this._mergeOptions(this.options.request, options);

                       var enabled = 0;
                       if (navigator.cookieEnabled === 'undefined') {
                             document.cookie = 'enabledCheck';
                             enabled = (document.cookie.indexOf('enabledCheck') !== -1) ? options.values['true'] : options.values['false'];
                       } else {
                             enabled = (navigator.cookieEnabled) ? options.values['true'] : options.values['false'];
                       }
                       return enabled;
                },

                // gets flash version information for metadata
                _getFlashVersion: function () {
                       var version = null;

                       // pulled from http://www.featureblend.com/flash_detect_1-0-4/flash_detect.js
                       if (navigator.plugins && navigator.plugins.length > 0) {
                             var type = 'application/x-shockwave-flash',
                                    mimeTypes = navigator.mimeTypes;
                             if (mimeTypes && mimeTypes[type] && mimeTypes[type].enabledPlugin && mimeTypes[type].enabledPlugin.description) {
                                    version = mimeTypes[type].enabledPlugin.description;
                             }
                       }

                       return version;
                },

                // get plugin data to check for
                _getPluginData: function () {
                       return {
                             director: 'application/x-director',
                             mediaplayer: 'application/x-mplayer2',
                             pdf: 'application/pdf',
                             quicktime: 'video/quicktime',
                             real: 'audio/x-pn-realaudio-plugin',
                             silverlight: 'application/x-silverlight'
                       };
                },

                //gets the IE plugin data
                _getPluginDataIE: function () {
                       var names = [ "abk", "wnt", "aol", "arb", "chs", "cht", "dht",
                                           "dhj", "dan", "dsh", "heb", "ie5", "icw", "ibe",
                                           "iec", "ieh", "iee", "jap", "krn", "lan", "swf",
                                           "shw", "msn", "wmp", "obp", "oex", "net", "pan",
                                           "thi", "tks", "uni", "vtc", "vnm", "mvm", "vbs",
                                           "wfd" ],
                             components = [ "7790769C-0471-11D2-AF11-00C04FA35D02",
                                           "89820200-ECBD-11CF-8B85-00AA005B4340",
                                           "47F67D00-9E55-11D1-BAEF-00C04FC2D130",
                                           "76C19B38-F0C8-11CF-87CC-0020AFEECF20",
                                           "76C19B34-F0C8-11CF-87CC-0020AFEECF20",
                                           "76C19B33-F0C8-11CF-87CC-0020AFEECF20",
                                           "9381D8F2-0288-11D0-9501-00AA00B911A5",
                                           "4F216970-C90C-11D1-B5C7-0000F8051515",
                                           "283807B5-2C60-11D0-A31D-00AA00B92C03",
                                           "44BBA848-CC51-11CF-AAFA-00AA00B6015C",
                                           "76C19B36-F0C8-11CF-87CC-0020AFEECF20",
                                           "89820200-ECBD-11CF-8B85-00AA005B4383",
                                           "5A8D6EE0-3E18-11D0-821E-444553540000",
                                           "630B1DA0-B465-11D1-9948-00C04F98BBC9",
                                           "08B0E5C0-4FCB-11CF-AAA5-00401C608555",
                                           "45EA75A0-A269-11D1-B5BF-0000F8051515",
                                           "DE5AED00-A4BF-11D1-9948-00C04F98BBC9",
                                           "76C19B30-F0C8-11CF-87CC-0020AFEECF20",
                                           "76C19B31-F0C8-11CF-87CC-0020AFEECF20",
                                           "76C19B50-F0C8-11CF-87CC-0020AFEECF20",
                                           "D27CDB6E-AE6D-11CF-96B8-444553540000",
                                           "2A202491-F00D-11CF-87CC-0020AFEECF20",
                                           "5945C046-LE7D-LLDL-BC44-00C04FD912BE",
                                           "22D6F312-B0F6-11D0-94AB-0080C74C7E95",
                                           "3AF36230-A269-11D1-B5BF-0000F8051515",
                                           "44BBA840-CC51-11CF-AAFA-00AA00B6015C",
                                           "44BBA842-CC51-11CF-AAFA-00AA00B6015B",
                                           "76C19B32-F0C8-11CF-87CC-0020AFEECF20",
                                           "76C19B35-F0C8-11CF-87CC-0020AFEECF20",
                                           "CC2A9BA0-3BDD-11D0-821E-444553540000",
                                           "3BF42070-B3B1-11D1-B5C5-0000F8051515",
                                           "10072CEC-8CC1-11D1-986E-00A0C955B42F",
                                           "76C19B37-F0C8-11CF-87CC-0020AFEECF20",
                                           "08B0E5C0-4FCB-11CF-AAA5-00401C608500",
                                           "4F645220-306D-11D2-995D-00C04F98BBC9",
                                           "73FA19D0-2D75-11D2-995D-00C04F98BBC9" ],
                             plugins = {},
                             body = document.body,
                             i, ver;
                       body.addBehavior("#default#clientCaps");

                       for (i = 0; i < components.length; i++) {
                             ver = body.getComponentVersion("{" + components[i] + "}", "componentid");
                             var name = names[i];
                             if (ver) {
                                    plugins[name] = ver;
                             }
                       }
                       return plugins;
                },

                // get list of plugins
                _getPlugins: function () {
                       var pluginArray = [],
                             name, flash,
                             plugins = this._getPluginData();

                       // Except IE browser supports navigator.plugins
                       // go through each plugin and check to see if it exists
                       for (name in plugins) {
                             if (this._detectPlugin(plugins[name])) {
                                    pluginArray.push(name);
                             }
                       }

                       // check for flash
                       flash = this._getFlashVersion();
                       if (flash) {
                             pluginArray.push(flash);
                       }

                       if (pluginArray.length === 0 && (navigator.appName === 'Microsoft Internet Explorer')) {
                             plugins = this._getPluginDataIE();

                             for (name in plugins) {
                                    pluginArray.push(name);
                             }
                       }

                       // return a comma delimited string of plugin names
                       return pluginArray.join(',');
                },

                // detect plugin by mime type
                _detectPlugin: function (type) {
                       var mimeTypes = navigator.mimeTypes,
                             plugin;
                       if (mimeTypes && mimeTypes.length) {
                             plugin = mimeTypes[type];
                             return (plugin && plugin.enabledPlugin);
                       }
                },

                // gets the value to send for the last form that was focused on
                _getLastFormFocusedValue: function () {
                       var value = '';
                       if (this._lastFormFocused) {
                        value = this._lastFormFocused.getAttribute('name') || this._lastFormFocused.getAttribute('id') || '';
           }
                       return value;
                },

                // gets the value to send for the last form that was focused on
                _getLastInputFocusedValue: function () {
                       var value = '';
                       if (this._lastInputFocused) {
                        value = this._lastInputFocused.getAttribute('name') || this._lastInputFocused.getAttribute('id') || '';
           }
                       return value;
                },

                // gets elements fom various styles of argument input (css string, elements array, element)
                _getElements: function (arg) {
                       var elements = [], i;
                       // get elements to be tracked from options
                       if (arg) {
                             // if they gave us a string we will search the dom
                             if (typeof arg === 'string') {
                                    elements = this.utils.getElements(arg);
                             }

                             // if they gave us an array of elements just copy over the items that actually are elements
                             else if (typeof arg === 'object') {
                                    for (i in arg) {
                                           if (arg.hasOwnProperty(i) && arg[i].nodeType === 1) {
                                                  elements.push(arg[i]);
                                           }
                                    }
                             }
                             // if they gave us one element then push it to the elements array
                             else if (arg.nodeType === 1) {
                                    elements.push(arg);
                             }
                       }
                       return elements;
                },

                // clicks the given element and changes page if it's a link
                _click: function (element) {
                       if (element.getAttribute('href')) {
                             window.location.href = element.getAttribute('href');
                       }
                },

                // sets options
                setOptions: function (options) {
            this.options = this._mergeOptions(this.options, options);
                },

                // sets custom request data
                setRequestData: function (key, value) {
                       if (typeof key === 'object') {
                             var i;
                             // user is setting multiple key/value pairs
                             for (i in key) {
                                    this.options.request.data[i] = key[i];
                             }
                       } else if (typeof key === 'string' && value === undefined) {
                             // user is setting key/value pairs using a query string
                             this.setRequestData(this.utils.queryStringToObject(key));
                       } else if (typeof key === 'string' && value !== undefined) {
                             // user is only setting one key/value pair
                             this.options.request.data[key] = value;
                       }
                },

                // gets custom request data
                getRequestData: function (key) {
                       var data = this.options.request.data;
                       if (key) {
                             data = data[key];
                       }
                       return data;
                },

                // removes custom request data by key
                removeRequestData: function (key) {
                       // if a key is provided, remove just that piece of data, otherwise remove it all
                       var data = this.options.request.data;
                       if (data[key]) {
                             delete data[key];
                       } else if (!key) {
                             data = {};
                       }
                },

                // sets browser lock/delay to defeat race condition
                setUnloadDelay: function (delay) {
                       this._delayUnloadUntil = new Date().getTime() + delay;
                },

                // record impression event
                recordImpression: function (options) {
                       // get keys from options
                       var eventData = {},
                             optKeys,      //caching options keys
                             screenDimensions,
                             browserDimensions;

                       options = this._mergeOptions(this.options.impression.request, options);
                       optKeys = options.keys;

                       // page title
                       eventData[optKeys.pageTitle] = this._getPageTitle();

                       // referrer url
                       eventData[optKeys.referrer] = this._getReferrer();

                       // screen color depth
                       eventData[optKeys.screenColorDepth] = this._getScreenColorDepth();

                       // screen dimensions
                       screenDimensions = this._getScreenDimensions();
                       eventData[optKeys.screenWidth] = screenDimensions.width;
                       eventData[optKeys.screenHeight] = screenDimensions.height;

                       // browser dimensions
                       browserDimensions = this._getBrowserDimensions();
                       eventData[optKeys.browserWidth] = browserDimensions.width;
                       eventData[optKeys.browserHeight] = browserDimensions.height;

                       // cookies enabled
                       eventData[optKeys.cookiesEnabled] = this._getCookiesEnabled(options);

                       // plugins
                       eventData[optKeys.plugins] = this._getPlugins();
                       this._recordEvent(eventData, options);
                },

                // record click event
                recordClick: function (options) {
                       // get keys from options
                       var eventData = {};

                       options = this._mergeOptions(this.options.click.request, options);
                       this._recordEvent(eventData, options);
                },

                // record form abandonment event
                recordFormAbandonment: function (options) {
                       // get keys from options
                       var eventData = {},
                       optKeys;

                       options = this._mergeOptions(this.options.formAbandonment.request, options);

                       optKeys = options.keys;

                       // last form focused
                       eventData[optKeys.lastFormFocused] = this._getLastFormFocusedValue();

                       // last input focused
                       eventData[optKeys.lastInputFocused] = this._getLastInputFocusedValue();

                       this._recordEvent(eventData, options);
                },

                // sets up click tracking
                trackClicks: function (options) {

                       var elements,
                             element,
                             i,
                             recordClick,
                             self = this;

                       // merge the click options
                       options = this._mergeOptions(this.options.click, options);

                       // merge the request options
                       options = this._mergeOptions({ request: this.options.request }, options);

                       // get elements from options
                       elements = this._getElements(options.elements);

                       // attach click events to elements
                       recordClick = function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    clickOptions,
                                    timeout;

                             if (typeof options.onClick === 'function') {
                                    clickOptions = options.onClick(ev);
                             }

                             // if the onClick returned false then we need to NOT track the click event
                             if (clickOptions !== false) {

                                    // if the onClick returns an object we need to treat it as the request options to be used for that click track event
                                    if (typeof clickOptions === 'object') {
                                           options.request = self._mergeOptions(options.request, clickOptions);
                                    }

                                    // get link url
                                    options.request.data[options.request.keys.linkUrl] = target.getAttribute('href') || '';

                                    self.recordClick(options.request);
                             }
                       };
                       for (i = 0; i < elements.length; i++) {
                          element = elements[i];
              this.utils.removeListener(element, 'click', recordClick);
                          this.utils.addListener(element, 'click', recordClick);
                       }
                },

                // track form abandonment
                trackFormAbandonment: function (options) {
                       var elements = [],
                             self = this,
                             i, //used in the for loop
                             elementsLength;

                       // merge the form abandonment options
                       options = this._mergeOptions(this.options.formAbandonment, options);

                       // merge the request options
                       options = this._mergeOptions({ request: this.options.request }, options);

                       // get elements from options
                       elements = this._getElements(options.elements);
                       elementsLength = elements.length;
                       // get all inputs within these elements
                       for (i = 0; i < elementsLength; i++) {
                             var element = elements[i],
                             // get all form elements individually so we can loop through and have a reference to the parent form of any given input
                             forms = (element.tagName.toLowerCase() === 'form') ? [element] : this.utils.getElements('form', element),
                             formsLength = forms.length, j;

                             for (j = 0; j < formsLength; j++) {
                                    var form = forms[j],
                                           inputs,
                                           inputsLength,
                                           input,
                                           k;

                                    // attach focus events to all inputs within this form to capture last form/input focused
                                    inputs = this.utils.getElements('input', form);
                                    inputsLength = inputs.length;
                                    for (k = 0; k < inputsLength; k++) {
                                           input = inputs[k];

                                           // use closure to maintain proper references of each iteration of input/form
                                           (function (form, input) {
                                                  self.utils.addListener(input, 'focus', function (ev) {
                                                         self._lastFormFocused = form;
                                                         self._lastInputFocused = input;

                                                         // attach unload function to window if it hasn't been done yet
                                                         if (!self._trackingFormAbandonment) {
                                                                self._trackingFormAbandonment = true;

                                                                // record form abandonment onbeforeunload
                                                                self.utils.addListener(window, 'beforeunload', function (ev) {
                                                                       // record form abandonment only if there's an incomplete form
                                                                       if (self._lastFormFocused !== null && self._lastInputFocused !== null) {
                                                                              self.recordFormAbandonment(options.request);
                                                                       }
                                                                });
                                                                // remove from abandonment event listener on submit of form, because they are not abandonoing the form
                                                                self.utils.addListener(form, 'submit', function (ev) {
                                                                       // set last form/input to null to indicate form completion
                                                                       self._lastFormFocused = null;
                                                                       self._lastInputFocused = null;
                                                                });
                                                         }
                                                  });
                                           })(form, input);
                                    }
                             }
                       }
                },

                // record arbitrary event
                record: function (options) {
                       options = this._mergeOptions(this.options.request, options);

                       // create request
                       this._request(options);
                }
         };

         // utils
         PAYPAL.analytics.Analytics.prototype.utils = {

                // deep clones an object
                clone: function (obj) {
                       // return if it is not an object
                       if (obj === null || obj.constructor !== Object) {
                             return obj;
                       }

                       // TODO: not real clone, has prototype issues

                       // clone object
                       var clone = obj.constructor(),
                             key;

                       // deep clone
                       for (key in obj) {
                             clone[key] = this.clone(obj[key]);
                       }

                       return clone;
                },

                // object merge (recursive merge and does not changed original objects)
                merge: function (obj1, obj2) {
                       // make sure we have some objects
                       obj1 = obj1 || {};
                       obj2 = obj2 || {};

                       // clone the objects so we don't affect the originals
                       var clone1 = this.clone(obj1),
                             clone2 = this.clone(obj2),
                             p;

                       // merge the objects recursively
                       for (p in clone2) {

                             try {
                                    if (clone2[p].constructor === Object) {
                                           clone1[p] = this.merge(clone1[p], clone2[p]);
                                    } else {
                                           clone1[p] = clone2[p];
                                    }
                             } catch (e) {
                                    clone1[p] = clone2[p];
                             }
                       }

                       // return our merged object
                       return clone1;
                },

                // converts query string to object
                queryStringToObject: function (string) {
                       var obj = {},
                             i,
                             parts,
                             pairs = string.split('&');
                       for (i = 0; i < pairs.length; i++) {
                             parts = pairs[i].split('=');
                             obj[parts[0]] = decodeURIComponent(parts[1]);
                       }
                       return obj;
                },

                // selector engine
                getElements: function (selector, parent) {
                       var elements = [],
                             i = 0,
                             length,
                             obj,
                             style,
                             nodes, //to store the list of child nodes
                             node;  //single node

                       // set parent to document if not passed
                       parent = parent || document;

                       // if the browser does not support querySelectorAll we need to do it ourselves
                       if (parent.querySelectorAll) {
                              obj = parent.querySelectorAll(selector);

                             // convert object/function to array of elements
                             if ((typeof obj === 'object' || typeof obj === 'function') && typeof obj.length === 'number') {
                                    for (i = 0; i < obj.length; i++) {
                                           elements.push(obj[i]);
                                    }
                             } else if (typeof obj === 'array') {
                                    elements = obj;
                             }
                       } else if (document.createStyleSheet) {
                             if (document.styleSheets.length) { // IE requires you check against the length as it bugs out otherwise
                                    style = document.styleSheets[0];
                             } else {
                                    style = document.createStyleSheet();
                             }

                             // split selector on comma because IE7 doesn't support comma delimited selectors
                             var selectors = selector.split(/\s*,\s*/),
                                    indexes = [],
                                    index;
                             for (i = 0; i < selectors.length; i++) {
                                    // create custom (random) style rule and add it to elements
                                    index = style.rules.length;
                                    indexes.push(index);
                                    style.addRule(selectors[i], 'aybabtu:pa', index);
                             }

                             // get all child nodes (document object has bugs with childNodes)
                             if (parent === document) {
                                    nodes = parent.all;
                             } else {
                                    nodes = parent.childNodes;
                             }

                             // cycle through all elements until we find the ones with our custom style rule
                             for (i = 0, length = nodes.length; i < length; i++) {
                                    node = nodes[i];
                                    if (node.nodeType === 1 && node.currentStyle.aybabtu === 'pa') {
                                           elements.push(node);
                                    }
                             }

                             // remove the custom style rules we added (go backwards through loop)
                             for (i = indexes.length - 1; i >= 0; i--) {
                                    style.removeRule(indexes[i]);
                             }
                       }
                       return elements;
                },

                // cross browser add event listener
                addListener: function (element, event, callback) {
                       if (element.addEventListener) {
                             element.addEventListener(event, callback, false);
                       } else if (element.attachEvent) {
                             return element.attachEvent('on' + event, callback);
                       }
                },

                // cross browser remove event listener
                // TODO: test this function, it has not been tested yet
                removeListener: function (event, element, callback) {
                       if (element.removeEventListener) {
                             element.removeEventListener(event, callback, false);
                       } else if (element.detachEvent) {
                             return element.detachEvent('on' + event, callback);
                       }
                },

                // sets cookie key/value pair
                setCookie: function (key, value, options) {
                       var date, expires;
                       options = options || {};

                       // convert expiration from days to ms
                       if (options.expires) {
                             date = new Date();
                             date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                             expires = '; expires=' + date.toGMTString();
                       } else {
                             expires = '';
                       }

                       // set the cookie
                       document.cookie = key + "=" + value + expires + '; path=/';
                },

                // gets cookie value from given key
                getCookie: function (key) {
                       // break cookie string into key/value segments and check for the given key
                       var segments = document.cookie.split(';'),
                             i;
                       for (i = 0; i < segments.length; i++) {
                             var segment = segments[i];

                             // trim leading white space
                             while (segment.charAt(0) === ' ') {
                                    segment = segment.substring(1, segment.length);
                             }

                             // check to see if this segment has they key they asked for at the beginning
                             if (segment.indexOf(key + '=') === 0) {
                                    return segment.substring((key + '=').length, segment.length);
                             }
                       }

                       // return null if key was not found
                       return null;
                },

                // removes a cookie key/value pair
                removeCookie: function (key) {
                       this.setCookie(key, '', { expires: -1 });
                }
         };

         // PAYPAL sugar layer
         // Adding the delay of 500 msec,
         // so that this Analytics JS is not blocking the execution of other important scripts in the page.
      PAYPAL.analytics.setup = function (options) {
              PAYPAL.analytics.setupComplete = PAYPAL.analytics.setupComplete || function () {};
              setTimeout(function () {
                   PAYPAL.analytics.setupComplete(PAYPAL.analytics.setup.init(options));
              }, 500);
         };

         PAYPAL.analytics.setup.init = function (options) {
                options = options || {};

          window.fptiserverurl = options.url || '//t.paypal.com/ts';

                // unload delay
                var unloadDelay = 500;


                // create analytics object with request options
                var analytics = new PAYPAL.analytics.Analytics({
                       request: {
                             data: options.data || {},
                             keys: {
                                    version: 'v',
                                    timestamp: 't',
                                    gmtOffset: 'g',
                                    eventType: 'e'
                             },
                             values: {
                                    eventType: 'na',
                                    'true': 1,
                                    'false': 0
                             },
                             keyPrefix: '', // no prefix
                             url: options.url || '//t.paypal.com/ts',
                             onBeaconCreate: function () {},
                             onBeaconDestroy: function () {}
                       }
                });

                if (options.data) {
                  window.fpti = analytics.utils.queryStringToObject(options.data);
                }

                // setup impression options
                var impressionOptions = {
                       keys: {
                             cookiesEnabled: 'ce',
                             plugins: 'pl',
                             jsVersion: 'jsv',
                             pageTitle: 'pt',
                             referrer: 'ru',
                             screenColorDepth: 'cd',
                             screenWidth: 'sw',
                             screenHeight: 'sh',
                             browserWidth: 'bw',
                             browserHeight: 'bh'
                       },
                       values: {
                             eventType: 'im'
                       }
                };

                // set pglk if we have something stored in the tcs cookie, then remove the cookie
                var pglk = analytics.utils.getCookie('tcs');
                analytics.utils.removeCookie('tcs');
                if (pglk) {
                    pglk = decodeURIComponent(pglk);
                    impressionOptions.data = { pglk: pglk };
                }

                // link text getter
                var getFirstText = function (element) {
                       var nodes = element.childNodes,
                             i,
                             node;
                       for (i = 0; i < nodes.length; i++) {
                             node = nodes[i];
                             if (node.nodeType === 3 && node.nodeValue && node.nodeValue.match(/\S/)) {
                                    return node.nodeValue;
                             } else if (node.nodeType === 1 && node.childNodes.length) {
                                    return getFirstText(node);
                             }
                       }
                };

                var getTargetAttr = function (target, primaryAttrName) {
                       var attr;
                       if (primaryAttrName) {
                             attr = target.getAttribute(primaryAttrName);
                       }
                       if (!attr) {
                             attr = target.getAttribute('name') ||
                                           target.getAttribute('id') || getFirstText(target) ||
                                           target.getAttribute('href');
                       }
                       return attr;
                };

                // record impression
                analytics.recordImpression(impressionOptions);

                // setup click tracking
                analytics.trackClicks({
                       elements: '*[data-pa-click]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = getTargetAttr(target, 'data-pa-click');

                             // return request options for this click event
                             return {
                                    data: {
                                           link: link
                                    }
                             };
                       },
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    linkUrl: 'lu'
                             },
                             values: {
                                    eventType: 'cl'
                             }
                       }
                });

                // setup exit click tracking
                analytics.trackClicks({
                       elements: '*[data-pa-exit]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = getTargetAttr(target, 'data-pa-exit');

                             // return request options for this click event
                             return {
                                    data: {
                                           link: link,
                                           exit: analytics.options.request.values['true']
                                    }
                             };
                       },
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    linkUrl: 'lu'
                             },
                             values: {
                                    eventType: 'cl'
                             }
                       }
                });

                // setup download click tracking
                analytics.trackClicks({
                       elements: '*[data-pa-download], *[href*=".zip"], *[href*=".wav"], *[href*=".mov"], *[href*=".mpg"], *[href*=".avi"], *[href*=".wmv"], *[href*=".doc"], *[href*=".docx"], *[href*=".pdf"], *[href*=".xls"], *[href*=".xlsx"], *[href*=".ppt"], *[href*=".pptx"], *[href*=".txt"], *[href*=".csv"], *[href*=".psd"], *[href*=".tar"]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = getTargetAttr(target, 'data-pa-download');

                             // return request options for this click event
                             return {
                                    data: {
                                           link: link,
                                           dwnl: analytics.options.request.values['true']
                                    }
                             };
                       },
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    linkUrl: 'lu'
                             },
                             values: {
                                    eventType: 'cl'
                             }
                       }
                });

                // setup legacy click tracking
                analytics.trackClicks({
                       elements: '*[class*="scTrack"]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = getTargetAttr(target);

                             // go through classes and find the link value
                             var classes = target.className.split(' '),
                                    i;
                             for (i = 0; i < classes.length; i++) {
                                    var parts = classes[i].split(':');
                                    if (parts[0] === 'scTrack' && parts.length > 1) {
                                           parts.shift();
                                           link = parts.join(':');
                                    }
                             }

                             // return request options for this click event
                             return {
                                    data: {
                                           link: link
                                    }
                             };
                       },
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    linkUrl: 'lu'
                             },
                             values: {
                                    eventType: 'cl'
                             }
                       }
                });

                // setup legacy exit click tracking
                analytics.trackClicks({
                       elements: '*[class*="scExit"]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = getTargetAttr(target);

                             // go through classes and find the link value
                             var classes = target.className.split(' '),
                                    i;
                             for (i = 0; i < classes.length; i++) {
                                    var parts = classes[i].split(':');
                                    if (parts[0] === 'scExit' && parts.length > 1) {
                                           parts.shift();
                                           link = parts.join(':');
                                    }
                             }

                             // return request options for this click event
                             return {
                                    data: {
                                           link: link,
                                           exit: analytics.options.request.values['true']
                                    }
                             };
                       },
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    linkUrl: 'lu'
                             },
                             values: {
                                    eventType: 'cl'
                             }
                       }
                });

                // setup click-through tracking
                analytics.trackClicks({
                       elements: 'a, button, input[type=submit], input[type=button], input[type=image]',
                       onClick: function (ev) {
                             var target = ev.currentTarget || ev.srcElement,
                                    link = target.getAttribute('data-pa-click') ||
                                                  target.getAttribute('data-pa-exit') ||
                                                  target.getAttribute('data-pa-download');
                             var pgrp = analytics.getRequestData('pgrp') || '';

                             // try to get the link name from legacy attributes if we don't have one
                             if (!link) {
                                    // go through classes and find the link value
                                    var classes = target.className.split(' '),
                                           i;
                                    for (i = 0; i < classes.length; i++) {
                                           var parts = classes[i].split(':');
                                           if ((parts[0] === 'scTrack' || parts[0] === 'scExit') && parts.length > 1) {
                                                  parts.shift();
                                                  link = parts.join(':');
                                           }
                                    }
                             }

                             // default to name/id/text if we still don't have a link value
                             if (!link) {
                                    link = getTargetAttr(target);
                             }

                             // create pglk value
                             var pglk = encodeURIComponent(pgrp + '|' + link);

                             // 100 char cookie value limit
                             //if (pglk.length > 100) {
                             //       pglk = pglk.substr(0, 100);
                             //}

                             // store cookie data for next page
                             analytics.utils.setCookie('tcs', pglk);

                              // return false so the link doesnt record a click event
                             return false;
                       }
                });

                // setup form abandonment
                analytics.trackFormAbandonment({
                       elements: 'form',
                       request: {
                             unloadDelay: unloadDelay,
                             keys: {
                                    lastFormFocused: 'lf',
                                    lastInputFocused: 'li'
                             },
                             values: {
                                    eventType: 'fa'
                             }
                       }
                });

                // return analytics object
                return PAYPAL.analytics.instance = analytics;

       };
}());

