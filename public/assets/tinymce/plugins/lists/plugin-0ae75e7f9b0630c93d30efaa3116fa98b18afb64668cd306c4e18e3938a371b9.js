/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.8.2 (2021-06-23)
 */
!function(){"use strict";var e,t,n,r=tinymce.util.Tools.resolve("tinymce.PluginManager"),o=function(r){return function(e){return n=typeof(t=e),(null===t?"null":"object"==n&&(Array.prototype.isPrototypeOf(t)||t.constructor&&"Array"===t.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(t)||t.constructor&&"String"===t.constructor.name)?"string":n)===r;var t,n}},i=function(t){return function(e){return typeof e===t}},a=o("string"),l=o("object"),u=o("array"),s=i("boolean"),c=i("function"),f=i("number"),d=function(){},y=function(e){return function(){return e}},m=function(t){return function(e){return!t(e)}},p=y(!1),g=y(!0),v=function(){return h},h=(e=function(e){return e.isNone()},{fold:function(e,t){return e()},is:p,isSome:p,isNone:g,getOr:n=function(e){return e},getOrThunk:t=function(e){return e()},getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:y(null),getOrUndefined:y(undefined),or:n,orThunk:t,map:v,each:d,bind:v,exists:p,forall:g,filter:v,equals:e,equals_:e,toArray:function(){return[]},toString:y("none()")}),S=function(n){var e=y(n),t=function(){return o},r=function(e){return e(n)},o={fold:function(e,t){return t(n)},is:function(e){return n===e},isSome:g,isNone:p,getOr:e,getOrThunk:e,getOrDie:e,getOrNull:e,getOrUndefined:e,or:t,orThunk:t,map:function(e){return S(e(n))},each:function(e){e(n)},bind:r,exists:r,forall:r,filter:function(e){return e(n)?o:h},toArray:function(){return[n]},toString:function(){return"some("+n+")"},equals:function(e){return e.is(n)},equals_:function(e,t){return e.fold(p,function(e){return t(n,e)})}};return o},C={some:S,none:v,from:function(e){return null===e||e===undefined?h:S(e)}},b=Array.prototype.slice,O=Array.prototype.push,N=function(e,t){for(var n=e.length,r=new Array(n),o=0;o<n;o++){var i=e[o];r[o]=t(i,o)}return r},L=function(e,t){for(var n=0,r=e.length;n<r;n++){t(e[n],n)}},T=function(e,t){for(var n=[],r=0,o=e.length;r<o;r++){var i=e[r];t(i,r)&&n.push(i)}return n},w=function(e,t,n){return L(e,function(e){n=t(n,e)}),n},D=function(e,t,n){for(var r=0,o=e.length;r<o;r++){var i=e[r];if(t(i,r))return C.some(i);if(n(i,r))break}return C.none()},k=function(e,t){return D(e,t,p)},x=function(e,t){return function(e){for(var t=[],n=0,r=e.length;n<r;++n){if(!u(e[n]))throw new Error("Arr.flatten item "+n+" was not an array, input: "+e);O.apply(t,e[n])}return t}(N(e,t))},A=function(e){var t=b.call(e,0);return t.reverse(),t},E=function(e,t){return 0<=t&&t<e.length?C.some(e[t]):C.none()},P=function(e){return E(e,0)},B=function(e){return E(e,e.length-1)},I=function(){return(I=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var o in t=arguments[n])Object.prototype.hasOwnProperty.call(t,o)&&(e[o]=t[o]);return e}).apply(this,arguments)};var R,M,U,_,$,F=function(e,t){var n=function(e,t){for(var n=0;n<e.length;n++){var r=e[n];if(r.test(t))return r}return undefined}(e,t);if(!n)return{major:0,minor:0};var r=function(e){return Number(t.replace(n,"$"+e))};return j(r(1),r(2))},H=function(){return j(0,0)},j=function(e,t){return{major:e,minor:t}},q={nu:j,detect:function(e,t){var n=String(t).toLowerCase();return 0===e.length?H():F(e,n)},unknown:H},K=function(e,t){var n=String(t).toLowerCase();return k(e,function(e){return e.search(n)})},V=function(e,n){return K(e,n).map(function(e){var t=q.detect(e.versionRegexes,n);return{current:e.name,version:t}})},W=function(e,n){return K(e,n).map(function(e){var t=q.detect(e.versionRegexes,n);return{current:e.name,version:t}})},Q=function(e,t){return-1!==e.indexOf(t)},X=(R=/^\s+|\s+$/g,function(e){return e.replace(R,"")}),z=/.*?version\/\ ?([0-9]+)\.([0-9]+).*/,Y=function(t){return function(e){return Q(e,t)}},Z=[{name:"Edge",versionRegexes:[/.*?edge\/ ?([0-9]+)\.([0-9]+)$/],search:function(e){return Q(e,"edge/")&&Q(e,"chrome")&&Q(e,"safari")&&Q(e,"applewebkit")}},{name:"Chrome",versionRegexes:[/.*?chrome\/([0-9]+)\.([0-9]+).*/,z],search:function(e){return Q(e,"chrome")&&!Q(e,"chromeframe")}},{name:"IE",versionRegexes:[/.*?msie\ ?([0-9]+)\.([0-9]+).*/,/.*?rv:([0-9]+)\.([0-9]+).*/],search:function(e){return Q(e,"msie")||Q(e,"trident")}},{name:"Opera",versionRegexes:[z,/.*?opera\/([0-9]+)\.([0-9]+).*/],search:Y("opera")},{name:"Firefox",versionRegexes:[/.*?firefox\/\ ?([0-9]+)\.([0-9]+).*/],search:Y("firefox")},{name:"Safari",versionRegexes:[z,/.*?cpu os ([0-9]+)_([0-9]+).*/],search:function(e){return(Q(e,"safari")||Q(e,"mobile/"))&&Q(e,"applewebkit")}}],G=[{name:"Windows",search:Y("win"),versionRegexes:[/.*?windows\ nt\ ?([0-9]+)\.([0-9]+).*/]},{name:"iOS",search:function(e){return Q(e,"iphone")||Q(e,"ipad")},versionRegexes:[/.*?version\/\ ?([0-9]+)\.([0-9]+).*/,/.*cpu os ([0-9]+)_([0-9]+).*/,/.*cpu iphone os ([0-9]+)_([0-9]+).*/]},{name:"Android",search:Y("android"),versionRegexes:[/.*?android\ ?([0-9]+)\.([0-9]+).*/]},{name:"OSX",search:Y("mac os x"),versionRegexes:[/.*?mac\ os\ x\ ?([0-9]+)_([0-9]+).*/]},{name:"Linux",search:Y("linux"),versionRegexes:[]},{name:"Solaris",search:Y("sunos"),versionRegexes:[]},{name:"FreeBSD",search:Y("freebsd"),versionRegexes:[]},{name:"ChromeOS",search:Y("cros"),versionRegexes:[/.*?chrome\/([0-9]+)\.([0-9]+).*/]}],J={browsers:y(Z),oses:y(G)},ee="Firefox",te=function(e){var t=e.current,n=e.version,r=function(e){return function(){return t===e}};return{current:t,version:n,isEdge:r("Edge"),isChrome:r("Chrome"),isIE:r("IE"),isOpera:r("Opera"),isFirefox:r(ee),isSafari:r("Safari")}},ne={unknown:function(){return te({current:undefined,version:q.unknown()})},nu:te,edge:y("Edge"),chrome:y("Chrome"),ie:y("IE"),opera:y("Opera"),firefox:y(ee),safari:y("Safari")},re="Windows",oe="Android",ie="Solaris",ae="FreeBSD",ue="ChromeOS",se=function(e){var t=e.current,n=e.version,r=function(e){return function(){return t===e}};return{current:t,version:n,isWindows:r(re),isiOS:r("iOS"),isAndroid:r(oe),isOSX:r("OSX"),isLinux:r("Linux"),isSolaris:r(ie),isFreeBSD:r(ae),isChromeOS:r(ue)}},ce={unknown:function(){return se({current:undefined,version:q.unknown()})},nu:se,windows:y(re),ios:y("iOS"),android:y(oe),linux:y("Linux"),osx:y("OSX"),solaris:y(ie),freebsd:y(ae),chromeos:y(ue)},fe=function(e,t){var n,r,o,i,a,u,s,c,f,d,l,m,p=J.browsers(),g=J.oses(),v=V(p,e).fold(ne.unknown,ne.nu),h=W(g,e).fold(ce.unknown,ce.nu);return{browser:v,os:h,deviceType:(r=v,o=e,i=t,a=(n=h).isiOS()&&!0===/ipad/i.test(o),u=n.isiOS()&&!a,s=n.isiOS()||n.isAndroid(),c=s||i("(pointer:coarse)"),f=a||!u&&s&&i("(min-device-width:768px)"),d=u||s&&!f,l=r.isSafari()&&n.isiOS()&&!1===/safari/i.test(o),m=!d&&!f&&!l,{isiPad:y(a),isiPhone:y(u),isTablet:y(f),isPhone:y(d),isTouch:y(c),isAndroid:n.isAndroid,isiOS:n.isiOS,isWebView:y(l),isDesktop:y(m)})}},de=function(e){return window.matchMedia(e).matches},le=(_=!(M=function(){return fe(navigator.userAgent,de)}),function(){for(var e=[],t=0;t<arguments.length;t++)e[t]=arguments[t];return _||(_=!0,U=M.apply(null,e)),U}),me=function(e){if(null===e||e===undefined)throw new Error("Node cannot be null or undefined");return{dom:e}},pe={fromHtml:function(e,t){var n=(t||document).createElement("div");if(n.innerHTML=e,!n.hasChildNodes()||1<n.childNodes.length)throw console.error("HTML does not have a single root node",e),new Error("HTML must have a single root node");return me(n.childNodes[0])},fromTag:function(e,t){var n=(t||document).createElement(e);return me(n)},fromText:function(e,t){var n=(t||document).createTextNode(e);return me(n)},fromDom:me,fromPoint:function(e,t,n){return C.from(e.dom.elementFromPoint(t,n)).map(me)}},ge=function(e,t){return e.dom===t.dom},ve=function(e,t){return n=e.dom,r=t.dom,o=n,i=r,a=Node.DOCUMENT_POSITION_CONTAINED_BY,0!=(o.compareDocumentPosition(i)&a);var n,r,o,i,a},he=function(e,t){return le().browser.isIE()?ve(e,t):(n=t,r=e.dom,o=n.dom,r!==o&&r.contains(o));var n,r,o},ye=function(e,t){var n=e.dom;if(1!==n.nodeType)return!1;var r=n;if(r.matches!==undefined)return r.matches(t);if(r.msMatchesSelector!==undefined)return r.msMatchesSelector(t);if(r.webkitMatchesSelector!==undefined)return r.webkitMatchesSelector(t);if(r.mozMatchesSelector!==undefined)return r.mozMatchesSelector(t);throw new Error("Browser lacks native selectors")},Se=tinymce.util.Tools.resolve("tinymce.dom.RangeUtils"),Ce=tinymce.util.Tools.resolve("tinymce.dom.TreeWalker"),be=tinymce.util.Tools.resolve("tinymce.util.VK"),Oe=Object.keys,Ne=function(e,t){for(var n=Oe(e),r=0,o=n.length;r<o;r++){var i=n[r];t(e[i],i)}},Le=function(e,t){var n,r,o,i,a={};return n=t,i=a,r=function(e,t){i[t]=e},o=d,Ne(e,function(e,t){(n(e,t)?r:o)(e,t)}),a},Te=("undefined"!=typeof window||Function("return this;")(),function(e){return e.dom.nodeName.toLowerCase()}),we=($=1,function(e){return e.dom.nodeType===$}),De=function(e,t){var n=e.dom;Ne(t,function(e,t){!function(e,t,n){if(!(a(n)||s(n)||f(n)))throw console.error("Invalid call to Attribute.set. Key ",t,":: Value ",n,":: Element ",e),new Error("Attribute value was not simple");e.setAttribute(t,n+"")}(n,t,e)})},ke=function(e){return w(e.dom.attributes,function(e,t){return e[t.name]=t.value,e},{})},xe=function(e){return C.from(e.dom.parentNode).map(pe.fromDom)},Ae=function(e){return N(e.dom.childNodes,pe.fromDom)},Ee=function(e,t){var n=e.dom.childNodes;return C.from(n[t]).map(pe.fromDom)},Pe=function(e){return Ee(e,0)},Be=function(e){return Ee(e,e.dom.childNodes.length-1)},Ie=function(t,n){xe(t).each(function(e){e.dom.insertBefore(n.dom,t.dom)})},Re=function(e,t){e.dom.appendChild(t.dom)},Me=function(t,e){L(e,function(e){Re(t,e)})},Ue=function(e){var t=e.dom;null!==t.parentNode&&t.parentNode.removeChild(t)},_e=function(e){return t=e,n=!0,pe.fromDom(t.dom.cloneNode(n));var t,n},$e=function(e,t){var n,r,o,i,a=(n=e,r=t,o=pe.fromTag(r),i=ke(n),De(o,i),o);Ie(e,a);var u=Ae(e);return Me(a,u),Ue(e),a},Fe=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),He=tinymce.util.Tools.resolve("tinymce.util.Tools"),je=function(t){return function(e){return e&&e.nodeName.toLowerCase()===t}},qe=function(t){return function(e){return e&&t.test(e.nodeName)}},Ke=function(e){return e&&3===e.nodeType},Ve=qe(/^(OL|UL|DL)$/),We=qe(/^(OL|UL)$/),Qe=je("ol"),Xe=qe(/^(LI|DT|DD)$/),ze=qe(/^(DT|DD)$/),Ye=qe(/^(TH|TD)$/),Ze=je("br"),Ge=function(e,t){return t&&!!e.schema.getTextBlockElements()[t.nodeName]},Je=function(e,t){return e&&e.nodeName in t},et=function(e,t,n){var r=e.isEmpty(t);return!(n&&0<e.select("span[data-mce-type=bookmark]",t).length)&&r},tt=function(e,t){return e.isChildOf(t,e.getRoot())},nt=function(e,t){var n,r,o,i,a=e.dom,u=e.schema.getBlockElements(),s=a.createFragment(),c=!1===(n=e.getParam("forced_root_block","p"))?"":!0===n?"p":n;if(c&&((o=a.create(c)).tagName===c.toUpperCase()&&a.setAttribs(o,e.getParam("forced_root_block_attrs",{})),Je(t.firstChild,u)||s.appendChild(o)),t)for(;r=t.firstChild;){var f=r.nodeName;i||"SPAN"===f&&"bookmark"===r.getAttribute("data-mce-type")||(i=!0),Je(r,u)?(s.appendChild(r),o=null):c?(o||(o=a.create(c),s.appendChild(o)),o.appendChild(r)):s.appendChild(r)}return c?i||o.appendChild(a.create("br",{"data-mce-bogus":"1"})):s.appendChild(a.create("br")),s},rt=Fe.DOM,ot=function(t,n){ye(n,"dd")?$e(n,"dt"):ye(n,"dt")&&xe(n).each(function(e){return function(e,t,n){var r=rt.select('span[data-mce-type="bookmark"]',t),o=nt(e,n),i=rt.createRng();i.setStartAfter(n),i.setEndAfter(t);for(var a,u=i.extractContents(),s=u.firstChild;s;s=s.firstChild)if("LI"===s.nodeName&&e.dom.isEmpty(s)){rt.remove(s);break}e.dom.isEmpty(u)||rt.insertAfter(u,t),rt.insertAfter(o,t),et(e.dom,n.parentNode)&&(a=n.parentNode,He.each(r,function(e){a.parentNode.insertBefore(e,n.parentNode)}),rt.remove(a)),rt.remove(n),et(e.dom,t)&&rt.remove(t)}(t,e.dom,n.dom)})},it=function(e){ye(e,"dt")&&$e(e,"dd")},at=function(e,t){if(Ke(e))return{container:e,offset:t};var n=Se.getNode(e,t);return Ke(n)?{container:n,offset:t>=e.childNodes.length?n.data.length:0}:n.previousSibling&&Ke(n.previousSibling)?{container:n.previousSibling,offset:n.previousSibling.data.length}:n.nextSibling&&Ke(n.nextSibling)?{container:n.nextSibling,offset:0}:{container:e,offset:t}},ut=function(e){var t=e.cloneRange(),n=at(e.startContainer,e.startOffset);t.setStart(n.container,n.offset);var r=at(e.endContainer,e.endOffset);return t.setEnd(r.container,r.offset),t},st=tinymce.util.Tools.resolve("tinymce.dom.DomQuery"),ct=function(e,t){var n=t||e.selection.getStart(!0);return e.dom.getParent(n,"OL,UL,DL",lt(e,n))},ft=function(e){var t,n,r,o=ct(e),i=e.selection.getSelectedBlocks();return r=i,(n=o)&&1===r.length&&r[0]===n?(t=o,He.grep(t.querySelectorAll("ol,ul,dl"),function(e){return Ve(e)})):He.grep(i,function(e){return Ve(e)&&o!==e})},dt=function(e){var n,t,r,o=e.selection.getSelectedBlocks();return He.grep((n=e,t=o,r=He.map(t,function(e){var t=n.dom.getParent(e,"li,dd,dt",lt(n,e));return t||e}),st.unique(r)),function(e){return Xe(e)})},lt=function(e,t){var n=e.dom.getParents(t,"TD,TH");return 0<n.length?n[0]:e.getBody()},mt=function(e,t){var n=e.dom.getParents(t,"ol,ul",lt(e,t));return B(n)},pt=function(e){var t,n,r,o=(n=mt(t=e,t.selection.getStart()),r=T(t.selection.getSelectedBlocks(),We),n.toArray().concat(r));return gt(e,o)},gt=function(t,e){var n=N(e,function(e){return mt(t,e).getOr(e)});return st.unique(n)},vt=function(e,t,n){return e.isSome()&&t.isSome()?C.some(n(e.getOrDie(),t.getOrDie())):C.none()},ht=function(e,t,n){return e.fire("ListMutation",{action:t,element:n})},yt=function(e,t,n){if(!a(n))throw console.error("Invalid call to CSS.set. Property ",t,":: Value ",n,":: Element ",e),new Error("CSS value must be a string: "+n);var r;(r=e).style!==undefined&&c(r.style.getPropertyValue)&&e.style.setProperty(t,n)},St=function(e,t){Re(e.item,t.list)},Ct=function(e,t,n){for(var r,o,i,a=[],u=0;u<n;u++)a.push((r=e,o=t.listType,i={list:pe.fromTag(o,r),item:pe.fromTag("li",r)},Re(i.list,i.item),i));return a},bt=function(e,t){for(var n,r,o,i,a=0;a<e.length-1;a++)n=e[a].item,r="list-style-type",o="none",i=n.dom,yt(i,r,o);B(e).each(function(e){De(e.list,t.listAttributes),De(e.item,t.itemAttributes),Me(e.item,t.content)})},Ot=function(f,e,d){var t=e.slice(0,d.depth);return B(t).each(function(e){var t,n,r,o,i,a,u,s,c=(t=f,n=d.itemAttributes,r=d.content,o=pe.fromTag("li",t),De(o,n),Me(o,r),o);a=c,Re((i=e).list,a),i.item=a,s=d,Te((u=e).list)!==s.listType&&(u.list=$e(u.list,s.listType)),De(u.list,s.listAttributes)}),t},Nt=function(e,t,n){var r,o=Ct(e,n,n.depth-t.length);return function(e){for(var t=1;t<e.length;t++)St(e[t-1],e[t])}(o),bt(o,n),r=o,vt(B(t),P(r),St),t.concat(o)},Lt=function(e){return ye(e,"OL,UL")},Tt=function(e){return Pe(e).map(Lt).getOr(!1)},wt=function(e){return 0<e.depth},Dt=function(e){return e.isSelected},kt=function(e){var t=Ae(e),n=Be(e).map(Lt).getOr(!1)?t.slice(0,-1):t;return N(n,_e)},xt=function(u){return L(u,function(r,e){var t,n,o,i,a;o=(t=u)[n=e].depth,i=function(e){return e.depth===o&&!e.dirty},a=function(e){return e.depth<o},D(A(t.slice(0,n)),i,a).orThunk(function(){return D(t.slice(n+1),i,a)}).fold(function(){var e;r.dirty&&((e=r).listAttributes=Le(e.listAttributes,function(e,t){return"start"!==t}))},function(e){return n=e,(t=r).listType=n.listType,void(t.listAttributes=I({},n.listAttributes));var t,n})}),u},At=function(i,a,u,s){return Pe(s).filter(Lt).fold(function(){a.each(function(e){ge(e.start,s)&&u.set(!0)});var t,n,r,e=(t=s,n=i,r=u.get(),xe(t).filter(we).map(function(e){return{depth:n,dirty:!1,isSelected:r,content:kt(t),itemAttributes:ke(t),listAttributes:ke(e),listType:Te(e)}}));a.each(function(e){ge(e.end,s)&&u.set(!1)});var o=Be(s).filter(Lt).map(function(e){return Et(i,a,u,e)}).getOr([]);return e.toArray().concat(o)},function(e){return Et(i,a,u,e)})},Et=function(t,n,r,e){return x(Ae(e),function(e){return(Lt(e)?Et:At)(t+1,n,r,e)})},Pt=function(e,t){var n,r=(n=!1,{get:function(){return n},set:function(e){n=e}});return N(e,function(e){return{sourceList:e,entries:Et(0,t,r,e)}})},Bt=function(i,e){var t=xt(e);return N(t,function(e){var t,n,r,o=(t=e.content,r=(n||document).createDocumentFragment(),L(t,function(e){r.appendChild(e.dom)}),pe.fromDom(r));return pe.fromDom(nt(i,o.dom))})},It=function(e,t){var n,r,o=xt(t);return n=e.contentDocument,r=w(o,function(e,t){return(t.depth>e.length?Nt:Ot)(n,e,t)},[]),P(r).map(function(e){return e.list}).toArray()},Rt=function(u,e,s){var t,n=Pt(e,(t=N(dt(u),pe.fromDom),vt(k(t,m(Tt)),k(A(t),m(Tt)),function(e,t){return{start:e,end:t}})));L(n,function(e){var t,n;t=e.entries,n=s,L(T(t,Dt),function(e){return function(e,t){switch(e){case"Indent":t.depth++;break;case"Outdent":t.depth--;break;case"Flatten":t.depth=0}t.dirty=!0}(n,e),0});var r,o,i,a=(r=u,o=e.entries,x(function(e,t){if(0===e.length)return[];for(var n=t(e[0]),r=[],o=[],i=0,a=e.length;i<a;i++){var u=e[i],s=t(u);s!==n&&(r.push(o),o=[]),n=s,o.push(u)}return 0!==o.length&&r.push(o),r}(o,wt),function(e){return(P(e).map(wt).getOr(!1)?It:Bt)(r,e)}));L(a,function(e){ht(u,"Indent"===s?"IndentList":"OutdentList",e.dom)}),i=e.sourceList,L(a,function(e){Ie(i,e)}),Ue(e.sourceList)})},Mt=function(e,t){var n,r,o=N(pt(e),pe.fromDom),i=N(T(dt(e),ze),pe.fromDom),a=!1;return(o.length||i.length)&&(n=e.selection.getBookmark(),Rt(e,o,t),r=e,L(i,"Indent"===t?it:function(e){return ot(r,e),0}),e.selection.moveToBookmark(n),e.selection.setRng(ut(e.selection.getRng())),e.nodeChanged(),a=!0),a},Ut=function(e){return Mt(e,"Indent")},_t=function(e){return Mt(e,"Outdent")},$t=function(e){return Mt(e,"Flatten")},Ft=tinymce.util.Tools.resolve("tinymce.dom.BookmarkManager"),Ht=Fe.DOM,jt=function(o){var i={},e=function(e){var t,n=o[e?"startContainer":"endContainer"],r=o[e?"startOffset":"endOffset"];1===n.nodeType&&(t=Ht.create("span",{"data-mce-type":"bookmark"}),n.hasChildNodes()?(r=Math.min(r,n.childNodes.length-1),e?n.insertBefore(t,n.childNodes[r]):Ht.insertAfter(t,n.childNodes[r])):n.appendChild(t),n=t,r=0),i[e?"startContainer":"endContainer"]=n,i[e?"startOffset":"endOffset"]=r};return e(!0),o.collapsed||e(),i},qt=function(o){var e=function(e){var t,n=t=o[e?"startContainer":"endContainer"],r=o[e?"startOffset":"endOffset"];n&&(1===n.nodeType&&(r=function(e){for(var t=e.parentNode.firstChild,n=0;t;){if(t===e)return n;1===t.nodeType&&"bookmark"===t.getAttribute("data-mce-type")||n++,t=t.nextSibling}return-1}(n),n=n.parentNode,Ht.remove(t),!n.hasChildNodes()&&Ht.isBlock(n)&&n.appendChild(Ht.create("br"))),o[e?"startContainer":"endContainer"]=n,o[e?"startOffset":"endOffset"]=r)};e(!0),e();var t=Ht.createRng();return t.setStart(o.startContainer,o.startOffset),o.endContainer&&t.setEnd(o.endContainer,o.endOffset),ut(t)},Kt=function(e){switch(e){case"UL":return"ToggleUlList";case"OL":return"ToggleOlList";case"DL":return"ToggleDLList"}},Vt=function(e){return/\btox\-/.test(e.className)},Wt=function(e,n,r){var t=function(e){var t=D(e.parents,Ve,Ye).filter(function(e){return e.nodeName===n&&!Vt(e)}).isSome();r(t)},o=e.dom.getParents(e.selection.getNode());return t({parents:o}),e.on("NodeChange",t),function(){return e.off("NodeChange",t)}},Qt=function(n,e){He.each(e,function(e,t){n.setAttribute(t,e)})},Xt=function(e,t,n){var r,o,i,a,u,s,c;r=e,o=t,a=(i=n)["list-style-type"]?i["list-style-type"]:null,r.setStyle(o,"list-style-type",a),u=e,Qt(s=t,(c=n)["list-attributes"]),He.each(u.select("li",s),function(e){Qt(e,c["list-item-attributes"])})},zt=function(e,t,n,r){var o=t[n?"startContainer":"endContainer"],i=t[n?"startOffset":"endOffset"];for(1===o.nodeType&&(o=o.childNodes[Math.min(i,o.childNodes.length-1)]||o),!n&&Ze(o.nextSibling)&&(o=o.nextSibling);o.parentNode!==r;){if(Ge(e,o))return o;if(/^(TD|TH)$/.test(o.parentNode.nodeName))return o;o=o.parentNode}return o},Yt=function(d,l,m){var e,t,n=d.selection.getRng(),p="LI",r=lt(d,d.selection.getStart(!0)),g=d.dom;"false"!==g.getContentEditable(d.selection.getNode())&&("DL"===(l=l.toUpperCase())&&(p="DT"),e=jt(n),t=function(n,e,r){for(var o,i=[],a=n.dom,t=zt(n,e,!0,r),u=zt(n,e,!1,r),s=[],c=t;c&&(s.push(c),c!==u);c=c.nextSibling);return He.each(s,function(e){if(Ge(n,e))return i.push(e),void(o=null);if(a.isBlock(e)||Ze(e))return Ze(e)&&a.remove(e),void(o=null);var t=e.nextSibling;Ft.isBookmarkNode(e)&&(Ve(t)||Ge(n,t)||!t&&e.parentNode===r)?o=null:(o||(o=a.create("p"),e.parentNode.insertBefore(o,e),i.push(o)),o.appendChild(e))}),i}(d,n,r),He.each(t,function(e){var t,n,r,o,i,a,u,s,c=e.previousSibling,f=e.parentNode;Xe(f)||(c&&Ve(c)&&c.nodeName===l&&(i=c,a=m,u=g.getStyle(i,"list-style-type"),s=a?a["list-style-type"]:"",u===(s=null===s?"":s))?(t=c,e=g.rename(e,p),c.appendChild(e)):(t=g.create(l),e.parentNode.insertBefore(t,e),t.appendChild(e),e=g.rename(e,p)),n=g,r=e,o=["margin","margin-right","margin-bottom","margin-left","margin-top","padding","padding-right","padding-bottom","padding-left","padding-top"],He.each(o,function(e){var t;return n.setStyle(r,((t={})[e]="",t))}),Xt(g,t,m),Gt(d.dom,t))}),d.selection.setRng(qt(e)))},Zt=function(e,t,n){return s=n,(u=t)&&s&&Ve(u)&&u.nodeName===s.nodeName&&(i=t,a=n,(o=e).getStyle(i,"list-style-type",!0)===o.getStyle(a,"list-style-type",!0))&&(r=n,t.className===r.className);var r,o,i,a,u,s},Gt=function(e,t){var n,r=t.nextSibling;if(Zt(e,t,r)){for(;n=r.firstChild;)t.appendChild(n);e.remove(r)}if(r=t.previousSibling,Zt(e,t,r)){for(;n=r.lastChild;)t.insertBefore(n,t.firstChild);e.remove(r)}},Jt=function(a,e,t,u,s){var n,r,o=Ve(e);o&&e.nodeName===u&&!en(s)?$t(a):(Yt(a,u,s),n=jt(a.selection.getRng(!0)),r=o?function(){for(var e=0,t=0,n=arguments.length;t<n;t++)e+=arguments[t].length;for(var r=Array(e),o=0,t=0;t<n;t++)for(var i=arguments[t],a=0,u=i.length;a<u;a++,o++)r[o]=i[a];return r}([e],t):t,He.each(r,function(e){var t,n,r,o,i;t=a,r=u,o=s,(n=e).nodeName!==r?(i=t.dom.rename(n,r),Xt(t.dom,i,o),ht(t,Kt(r),i)):(Xt(t.dom,n,o),ht(t,Kt(r),n))}),a.selection.setRng(qt(n)))},en=function(e){return"list-style-type"in e},tn=function(e,t,n){var r,o,i,a,u,s,c=ct(e),f=ft(e),d=l(n)?n:{};0<f.length?Jt(e,c,f,t,d):(i=t,a=d,(o=c)!==(r=e).getBody()&&(o?o.nodeName!==i||en(a)||Vt(o)?(u=jt(r.selection.getRng(!0)),Xt(r.dom,o,a),s=r.dom.rename(o,i),Gt(r.dom,s),r.selection.setRng(qt(u)),Yt(r,i,a),ht(r,Kt(i),s)):$t(r):(Yt(r,i,a),ht(r,Kt(i),o))))},nn=Fe.DOM,rn=function(i,e){He.each(He.grep(i.select("ol,ul",e)),function(e){var t,n,r,o;t=i,"LI"===(o=(n=e).parentNode).nodeName&&o.firstChild===n&&((r=o.previousSibling)&&"LI"===r.nodeName?(r.appendChild(n),et(t,o)&&nn.remove(o)):nn.setStyle(o,"listStyleType","none")),Ve(o)&&(r=o.previousSibling)&&"LI"===r.nodeName&&r.appendChild(n)})},on=function(e,t,n,r){var o=t.startContainer,i=t.startOffset;if(Ke(o)&&(n?i<o.data.length:0<i))return o;var a=e.schema.getNonEmptyElements();1===o.nodeType&&(o=Se.getNode(o,i));var u,s,c=new Ce(o,r);for(n&&(u=e.dom,Ze(s=o)&&u.isBlock(s.nextSibling)&&!Ze(s.previousSibling)&&c.next());o=c[n?"next":"prev2"]();){if("LI"===o.nodeName&&!o.hasChildNodes())return o;if(a[o.nodeName])return o;if(Ke(o)&&0<o.data.length)return o}},an=function(e,t){var n=t.childNodes;return 1===n.length&&!Ve(n[0])&&e.isBlock(n[0])},un=function(e,t,n){var r,o,i,a=an(e,n)?n.firstChild:n;if(an(o=e,i=t)&&o.remove(i.firstChild,!0),!et(e,t,!0))for(;r=t.firstChild;)a.appendChild(r)},sn=function(t,e,n){var r,o,i,a=e.parentNode;tt(t,e)&&tt(t,n)&&(Ve(n.lastChild)&&(r=n.lastChild),a===n.lastChild&&Ze(a.previousSibling)&&t.remove(a.previousSibling),(o=n.lastChild)&&Ze(o)&&e.hasChildNodes()&&t.remove(o),et(t,n,!0)&&t.$(n).empty(),un(t,e,n),r&&n.appendChild(r),i=he(pe.fromDom(n),pe.fromDom(e))?t.getParents(e,Ve,n):[],t.remove(e),L(i,function(e){et(t,e)&&e!==t.getRoot()&&t.remove(e)}))},cn=function(e,t,n,r){var o,i,a,u,s=e.dom;s.isEmpty(r)?(a=n,u=r,(i=e).dom.$(u).empty(),sn(i.dom,a,u),i.selection.setCursorLocation(u,0)):(o=jt(t),sn(s,n,r),e.selection.setRng(qt(o)))},fn=function(t,n){var e=t.dom,r=t.selection,o=r.getStart(),i=lt(t,o),a=e.getParent(r.getStart(),"LI",i);if(a){var u=a.parentNode;if(u===t.getBody()&&et(e,u))return!0;var s=ut(r.getRng()),c=e.getParent(on(t,s,n,i),"LI",i);if(c&&c!==a)return t.undoManager.transact(function(){var e;n?cn(t,s,c,a):(e=a).parentNode.firstChild===e?_t(t):function(e,t,n,r){var o=jt(t);sn(e.dom,n,r);var i=qt(o);e.selection.setRng(i)}(t,s,a,c)}),!0;if(!c&&!n&&0===s.startOffset&&0===s.endOffset)return t.undoManager.transact(function(){$t(t)}),!0}return!1},dn=function(o,i){var a=o.dom,e=o.selection.getStart(),u=lt(o,e),s=a.getParent(e,a.isBlock,u);if(s&&a.isEmpty(s)){var t=ut(o.selection.getRng()),c=a.getParent(on(o,t,i,u),"LI",u);if(c)return o.undoManager.transact(function(){var e,t,n,r;t=s,n=u,r=(e=a).getParent(t.parentNode,e.isBlock,n),e.remove(t),r&&e.isEmpty(r)&&e.remove(r),Gt(a,c.parentNode),o.selection.select(c,!0),o.selection.collapse(i)}),!0}return!1},ln=function(e,t){return e.selection.isCollapsed()?fn(i=e,a=t)||dn(i,a):(r=(n=e).selection.getStart(),o=lt(n,r),!!(n.dom.getParent(r,"LI,DT,DD",o)||0<dt(n).length)&&(n.undoManager.transact(function(){n.execCommand("Delete"),rn(n.dom,n.getBody())}),!0));var n,r,o,i,a},mn=function(e){var t=A(X(e).split("")),n=N(t,function(e,t){var n=e.toUpperCase().charCodeAt(0)-"A".charCodeAt(0)+1;return Math.pow(26,t)*n});return w(n,function(e,t){return e+t},0)},pn=function(e){if(--e<0)return"";var t=e%26,n=Math.floor(e/26);return pn(n)+String.fromCharCode("A".charCodeAt(0)+t)},gn=function(t){var e,n,r=ct(t);Qe(r)&&t.windowManager.open({title:"List Properties",body:{type:"panel",items:[{type:"input",name:"start",label:"Start list at number",inputMode:"numeric"}]},initialData:{start:(e={start:t.dom.getAttrib(r,"start","1"),listStyleType:C.some(t.dom.getStyle(r,"list-style-type"))},n=parseInt(e.start,10),e.listStyleType.is("upper-alpha")?pn(n):e.listStyleType.is("lower-alpha")?pn(n).toLowerCase():e.start)},buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],onSubmit:function(e){(function(e){switch(/^[0-9]+$/.test(t=e)?2:/^[A-Z]+$/.test(t)?0:/^[a-z]+$/.test(t)?1:0<t.length?4:3){case 2:return C.some({listStyleType:C.none(),start:e});case 0:return C.some({listStyleType:C.some("upper-alpha"),start:mn(e).toString()});case 1:return C.some({listStyleType:C.some("lower-alpha"),start:mn(e).toString()});case 3:return C.some({listStyleType:C.none(),start:""});case 4:return C.none()}var t})(e.getData().start).each(function(e){t.execCommand("mceListUpdate",!1,{attrs:{start:"1"===e.start?"":e.start},styles:{"list-style-type":e.listStyleType.getOr("")}})}),e.close()}})},vn=function(t,n){return function(){var e=ct(t);return e&&e.nodeName===n}},hn=function(e){e.addCommand("mceListProps",function(){gn(e)})},yn=function(i){i.on("BeforeExecCommand",function(e){var t=e.command.toLowerCase();"indent"===t?Ut(i):"outdent"===t&&_t(i)}),i.addCommand("InsertUnorderedList",function(e,t){tn(i,"UL",t)}),i.addCommand("InsertOrderedList",function(e,t){tn(i,"OL",t)}),i.addCommand("InsertDefinitionList",function(e,t){tn(i,"DL",t)}),i.addCommand("RemoveList",function(){$t(i)}),hn(i),i.addCommand("mceListUpdate",function(e,t){var n,r,o;l(t)&&(r=t,o=ct(n=i),n.undoManager.transact(function(){l(r.styles)&&n.dom.setStyles(o,r.styles),l(r.attrs)&&Ne(r.attrs,function(e,t){return n.dom.setAttrib(o,t,e)})}))}),i.addQueryStateHandler("InsertUnorderedList",vn(i,"UL")),i.addQueryStateHandler("InsertOrderedList",vn(i,"OL")),i.addQueryStateHandler("InsertDefinitionList",vn(i,"DL"))},Sn=function(e){var t,n;e.getParam("lists_indent_on_tab",!0)&&(t=e).on("keydown",function(e){e.keyCode!==be.TAB||be.metaKeyPressed(e)||t.undoManager.transact(function(){(e.shiftKey?_t:Ut)(t)&&e.preventDefault()})}),(n=e).on("keydown",function(e){e.keyCode===be.BACKSPACE?ln(n,!1)&&e.preventDefault():e.keyCode===be.DELETE&&ln(n,!0)&&e.preventDefault()})};r.add("lists",function(e){var t,n,r,o,i;return!1===e.hasPlugin("rtc",!0)?(Sn(e),yn(e)):hn(e),n=function(e){return function(){return t.execCommand(e)}},(t=e).hasPlugin("advlist")||(t.ui.registry.addToggleButton("numlist",{icon:"ordered-list",active:!1,tooltip:"Numbered list",onAction:n("InsertOrderedList"),onSetup:function(e){return Wt(t,"OL",e.setActive)}}),t.ui.registry.addToggleButton("bullist",{icon:"unordered-list",active:!1,tooltip:"Bullet list",onAction:n("InsertUnorderedList"),onSetup:function(e){return Wt(t,"UL",e.setActive)}})),o={text:"List properties...",icon:"ordered-list",onAction:function(){return r.execCommand("mceListProps")},onSetup:function(t){return Wt(r,"OL",function(e){return t.setDisabled(!e)})}},(r=e).ui.registry.addMenuItem("listprops",o),r.ui.registry.addContextMenu("lists",{update:function(e){var t=ct(r,e);return Qe(t)?["listprops"]:[]}}),i=e,{backspaceDelete:function(e){ln(i,e)}}})}();
