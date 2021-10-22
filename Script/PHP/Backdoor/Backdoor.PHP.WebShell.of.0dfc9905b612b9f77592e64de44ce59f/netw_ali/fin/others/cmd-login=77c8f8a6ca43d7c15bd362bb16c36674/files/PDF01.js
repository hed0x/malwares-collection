        window.scReport = function (pageName) {
            s = s_gi("adbims");
            s.visitorNamespace = "adobecorp"
            s.trackingServer = "stats.adobe.com"
            s.trackingServerSecure = "sstats.adobe.com"

            pageName = pageName || 'SignIn_Form';
            var stateFull = '{\"ac\":\"\"}' || '{}',
                    state = JSON.parse(stateFull),
                    ac = state["ac"] || '',
                    sChannel = "IMS",
                    sAccount = "adbimsqa,adbadobenonacdcqa";

            var viElement = document.getElementById("vi");
            if (viElement) {
                viElement.value = s.c_r("s_vi");
            }
            if (pageName == "SignIn_Form") {
                s.pageName="Account:OnLoad_ims_SignInForm";
                s.prop5 = "en_US:"+ s.pageName;
                s.eVar13 = "SignInForm";
            } else if (pageName == "Create_Form") {
                s.pageName = "Account:OnLoad_ims_SignUpForm";
                s.prop5 = "en_US:"+ s.pageName;
                s.eVar13 = "SignUpForm";
            }

            s.account = sAccount;
            s.channel = sChannel;
            s.prop3 = "services.adobe.com";
            s.prop4 = "en_US";
            s.prop60="";
            s.prop47 ="";
            s.eVar30 = "adobedotcom_TOU_client2";
            s.prop22=ac;


            if (pageName) {
                var originalParent = window.parent;
                try {
                    window.parent = window;
                } catch (e) {
                }
                var result = s.t();
                try {
                    window.parent = originalParent;
                } catch (e) {
                }
                return result;
            }
        };

        /************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
        var s_code = scReport();
        if (s_code)document.write(s_code);

        if (navigator.appVersion.indexOf('MSIE') >= 0)document.write(unescape('%3C') + '\!-' + '-')
                