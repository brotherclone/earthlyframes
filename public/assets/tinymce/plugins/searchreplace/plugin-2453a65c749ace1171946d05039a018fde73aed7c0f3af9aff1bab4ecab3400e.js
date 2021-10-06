/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.9.2 (2021-09-08)
 */
!function(){"use strict";function g(e){var t=e;return{get:function(){return t},set:function(e){t=e}}}function e(r){return function(e){return n=typeof(t=e),(null===t?"null":"object"==n&&(Array.prototype.isPrototypeOf(t)||t.constructor&&"Array"===t.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(t)||t.constructor&&"String"===t.constructor.name)?"string":n)===r;var t,n}}function t(t){return function(e){return typeof e===t}}function p(){}function i(e){return function(){return e}}function n(e){return e}function r(){return m}var o=tinymce.util.Tools.resolve("tinymce.PluginManager"),v=function(){return(v=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var o in t=arguments[n])Object.prototype.hasOwnProperty.call(t,o)&&(e[o]=t[o]);return e}).apply(this,arguments)},a=e("string"),c=e("array"),u=t("boolean"),l=t("number"),s=i(!1),f=i(!0),d=i("[!-#%-*,-\\/:;?@\\[-\\]_{}\xa1\xab\xb7\xbb\xbf;\xb7\u055a-\u055f\u0589\u058a\u05be\u05c0\u05c3\u05c6\u05f3\u05f4\u0609\u060a\u060c\u060d\u061b\u061e\u061f\u066a-\u066d\u06d4\u0700-\u070d\u07f7-\u07f9\u0830-\u083e\u085e\u0964\u0965\u0970\u0df4\u0e4f\u0e5a\u0e5b\u0f04-\u0f12\u0f3a-\u0f3d\u0f85\u0fd0-\u0fd4\u0fd9\u0fda\u104a-\u104f\u10fb\u1361-\u1368\u1400\u166d\u166e\u169b\u169c\u16eb-\u16ed\u1735\u1736\u17d4-\u17d6\u17d8-\u17da\u1800-\u180a\u1944\u1945\u1a1e\u1a1f\u1aa0-\u1aa6\u1aa8-\u1aad\u1b5a-\u1b60\u1bfc-\u1bff\u1c3b-\u1c3f\u1c7e\u1c7f\u1cd3\u2010-\u2027\u2030-\u2043\u2045-\u2051\u2053-\u205e\u207d\u207e\u208d\u208e\u3008\u3009\u2768-\u2775\u27c5\u27c6\u27e6-\u27ef\u2983-\u2998\u29d8-\u29db\u29fc\u29fd\u2cf9-\u2cfc\u2cfe\u2cff\u2d70\u2e00-\u2e2e\u2e30\u2e31\u3001-\u3003\u3008-\u3011\u3014-\u301f\u3030\u303d\u30a0\u30fb\ua4fe\ua4ff\ua60d-\ua60f\ua673\ua67e\ua6f2-\ua6f7\ua874-\ua877\ua8ce\ua8cf\ua8f8-\ua8fa\ua92e\ua92f\ua95f\ua9c1-\ua9cd\ua9de\ua9df\uaa5c-\uaa5f\uaade\uaadf\uabeb\ufd3e\ufd3f\ufe10-\ufe19\ufe30-\ufe52\ufe54-\ufe61\ufe63\ufe68\ufe6a\ufe6b\uff01-\uff03\uff05-\uff0a\uff0c-\uff0f\uff1a\uff1b\uff1f\uff20\uff3b-\uff3d\uff3f\uff5b\uff5d\uff5f-\uff65]"),m={fold:function(e,t){return e()},isSome:s,isNone:f,getOr:n,getOrThunk:h,getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:i(null),getOrUndefined:i(void 0),or:n,orThunk:h,map:r,each:p,bind:r,exists:s,forall:f,filter:function(){return m},toArray:function(){return[]},toString:i("none()")};function h(e){return e()}function y(e,t){for(var n=e.length,r=new Array(n),o=0;o<n;o++){var i=e[o];r[o]=t(i,o)}return r}function x(e,t){for(var n=0,r=e.length;n<r;n++)t(e[n],n)}function b(e,t){for(var n=e.length-1;0<=n;n--)t(e[n],n)}function w(e,t){return function(e){for(var t=[],n=0,r=e.length;n<r;++n){if(!c(e[n]))throw new Error("Arr.flatten item "+n+" was not an array, input: "+e);S.apply(t,e[n])}return t}(y(e,t))}function O(e,t){return A.call(e,t)}var C=function(n){function e(){return o}function t(e){return e(n)}var r=i(n),o={fold:function(e,t){return t(n)},isSome:f,isNone:s,getOr:r,getOrThunk:r,getOrDie:r,getOrNull:r,getOrUndefined:r,or:e,orThunk:e,map:function(e){return C(e(n))},each:function(e){e(n)},bind:t,exists:t,forall:t,filter:function(e){return e(n)?o:m},toArray:function(){return[n]},toString:function(){return"some("+n+")"}};return o},T={some:C,none:r,from:function(e){return null==e?m:C(e)}},E=d,N=tinymce.util.Tools.resolve("tinymce.util.Tools"),k=Array.prototype.slice,S=Array.prototype.push,A=Object.hasOwnProperty;function D(e,t,n){!function(e,t,n){if(!(a(n)||u(n)||l(n)))throw console.error("Invalid call to Attribute.set. Key ",t,":: Value ",n,":: Element ",e),new Error("Attribute value was not simple");e.setAttribute(t,n+"")}(e.dom,t,n)}function M(e,t){return{element:e,offset:t}}function B(e,t){var n,r;n=e,r=t,T.from(n.dom.parentNode).map(se.fromDom).each(function(e){e.dom.insertBefore(r.dom,n.dom)}),t.dom.appendChild(e.dom)}function F(e){return fe.get(e)}function I(e,t){return e.isBlock(t)||O(e.schema.getShortEndedElements(),t.nodeName)}function P(e,t){return"false"===e.getContentEditable(t)}function R(e,t){return!e.isBlock(t)&&O(e.schema.getWhiteSpaceElements(),t.nodeName)}function W(){return{sOffset:0,fOffset:0,elements:[]}}function j(e,t){return n=se.fromDom(e),r=t,0<(o=y(n.dom.childNodes,se.fromDom)).length&&r<o.length?M(o[r],0):M(n,r);var n,r,o}function V(e,t,n,r,o,i){for(var a=(i=void 0===i||i)?t(!1):n;a;){var c=P(e,a);if(c||R(e,a)){if(c?r.cef(a):r.boundary(a))break;a=t(!0)}else{if(I(e,a)){if(r.boundary(a))break}else 3===a.nodeType&&r.text(a);if(a===o)break;a=t(!1)}}}function H(e,t,n,r,o){var i,a,c,u,l,s;I(i=e,a=n)||P(i,a)||R(i,a)||"true"===(c=i).getContentEditable(u=a)&&"false"===c.getContentEditableParent(u.parentNode)||(l=e.getParent(r,e.isBlock),s=new de(n,l),V(e,(o?s.next:s.prev).bind(s),n,{boundary:f,cef:f,text:function(e){o?t.fOffset+=e.length:t.sOffset+=e.length,t.elements.push(se.fromDom(e))}}))}function L(e,t,n,r,o,i){void 0===i&&(i=!0);var a=new de(n,t),c=[],u=W();function l(){return 0<u.elements.length&&(c.push(u),u=W()),!1}return H(e,u,n,t,!1),V(e,a.next.bind(a),n,{boundary:l,cef:function(e){return l(),o&&c.push.apply(c,o.cef(e)),!1},text:function(e){u.elements.push(se.fromDom(e)),o&&o.text(e,u)}},r,i),r&&H(e,u,r,t,!0),l(),c}function U(u,e){var n=j(e.startContainer,e.startOffset),r=n.element.dom,o=j(e.endContainer,e.endOffset),i=o.element.dom;return L(u,e.commonAncestorContainer,r,i,{text:function(e,t){e===i?t.fOffset+=e.length-o.offset:e===r&&(t.sOffset+=n.offset)},cef:function(e){var t,n,r,o,i,a=w((n=se.fromDom(e),r="*[contenteditable=true]",1!==(o=i=void 0===n?document:n.dom).nodeType&&9!==o.nodeType&&11!==o.nodeType||0===o.childElementCount?[]:y(i.querySelectorAll(r),se.fromDom)),function(e){var t=e.dom;return L(u,t,t)}),c=function(e,t){return n=e.elements[0].dom,r=t.elements[0].dom,o=Node.DOCUMENT_POSITION_PRECEDING,0!=(n.compareDocumentPosition(r)&o)?1:-1;var n,r,o};return(t=k.call(a,0)).sort(c),t}},!1)}function $(e,t){return t.collapsed?[]:U(e,t)}function _(e,t){var n=e.createRng();return n.selectNode(t),$(e,n)}function z(c,e){return w(e,function(e){var a,n,r,t=e.elements,o=y(t,F).join(""),i=function(e,t,n,r){void 0===r&&(r=e.length);var o=t.regex;o.lastIndex=n=void 0===n?0:n;for(var i,a=[];i=o.exec(e);){var c=i[t.matchIndex],u=i.index+i[0].indexOf(c),l=u+c.length;if(r<l)break;a.push({start:u,finish:l}),o.lastIndex=l}return a}(o,c,e.sOffset,o.length-e.fOffset);return a=i,function(e,t){if(0===e.length)return[];for(var n=t(e[0]),r=[],o=[],i=0,a=e.length;i<a;i++){var c=e[i],u=t(c);u!==n&&(r.push(o),o=[]),n=u,o.push(c)}return 0!==o.length&&r.push(o),r}((n=function(e,n){var t=F(n),r=e.last,o=r+t.length,i=w(a,function(e,t){return e.start<o&&e.finish>r?[{element:n,start:Math.max(r,e.start)-r,finish:Math.min(o,e.finish)-r,matchId:t}]:[]});return{results:e.results.concat(i),last:o}},r={results:[],last:0},x(t,function(e,t){r=n(r,e)}),r.results),function(e){return e.matchId})})}function q(e,i){b(e,function(e,o){b(e,function(e){var t=se.fromDom(i.cloneNode(!1));D(t,"data-mce-index",o);var n,r=e.element.dom;r.length===e.finish&&0===e.start?B(e.element,t):(r.length!==e.finish&&r.splitText(e.finish),n=r.splitText(e.start),B(se.fromDom(n),t))})})}function G(e){var t=e.getAttribute("data-mce-index");return"number"==typeof t?""+t:t}function K(e,t,n,r){var o=e.dom.create("span",{"data-mce-bogus":1});o.className="mce-match-marker";var i,a,c,u,l,s,f,d,m,h,g=e.getBody();return me(e,t,!1),r?(c=e.dom,u=n,l=e.selection,s=o,d=l.getBookmark(),m=c.select("td[data-mce-selected],th[data-mce-selected]"),q(h=z(u,0<m.length?(f=c,w(m,function(e){return _(f,e)})):$(c,l.getRng())),s),l.moveToBookmark(d),h.length):(i=o,q(a=z(n,_(e.dom,g)),i),a.length)}function J(e){var t=e.parentNode;e.firstChild&&t.insertBefore(e.firstChild,e),e.parentNode.removeChild(e)}function Q(e,t){var n=[],r=N.toArray(e.getBody().getElementsByTagName("span"));if(r.length)for(var o=0;o<r.length;o++){var i=G(r[o]);null!==i&&i.length&&i===t.toString()&&n.push(r[o])}return n}function X(e,t,n){var r=t.get(),o=r.index,i=e.dom;(n=!1!==n)?o+1===r.count?o=0:o++:o-1==-1?o=r.count-1:o--,i.removeClass(Q(e,r.index),"mce-match-marker-selected");var a=Q(e,o);return a.length?(i.addClass(Q(e,o),"mce-match-marker-selected"),e.selection.scrollIntoView(a[0]),o):-1}function Y(e,t){var n=t.parentNode;e.remove(t),e.isEmpty(n)&&e.remove(n)}function Z(e,t,n,r,o,i){var a,c,u,l=(a=o,c="("+n.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&").replace(/\s/g,"[^\\S\\r\\n\\uFEFF]")+")",a?"(?:^|\\s|"+E()+")"+c+"(?=$|\\s|"+E()+")":c),s=K(e,t,{regex:new RegExp(l,r?"g":"gi"),matchIndex:1},i);return s&&(u=X(e,t,!0),t.set({index:u,count:s,text:n,matchCase:r,wholeWord:o,inSelection:i})),s}function ee(e,t){var n=X(e,t,!0);t.set(v(v({},t.get()),{index:n}))}function te(e,t){var n=X(e,t,!1);t.set(v(v({},t.get()),{index:n}))}function ne(e){var t=G(e);return null!==t&&0<t.length}function re(e,t,n,r,o){var i,a=t.get(),c=a.index,u=c;r=!1!==r;for(var l=e.getBody(),s=N.grep(N.toArray(l.getElementsByTagName("span")),ne),f=0;f<s.length;f++){var d=G(s[f]),m=i=parseInt(d,10);if(o||m===a.index){for(n.length?(s[f].firstChild.nodeValue=n,J(s[f])):Y(e.dom,s[f]);s[++f];){if((m=parseInt(G(s[f]),10))!==i){f--;break}Y(e.dom,s[f])}r&&u--}else c<i&&s[f].setAttribute("data-mce-index",String(i-1))}return t.set(v(v({},a),{count:o?0:a.count-1,index:u})),(r?ee:te)(e,t),!o&&0<t.get().count}function oe(i,a){var e,t,n,r=(e=p,t=g(T.none()),v(v({},n={clear:function(){o(),t.set(T.none())},isSet:function(){return t.get().isSome()},get:function(){return t.get()},set:function(e){o(),t.set(T.some(e))}}),{on:function(e){return n.get().each(e)}}));function o(){return t.get().each(e)}function c(e){(1<a.get().count?e.enable:e.disable)("next"),(1<a.get().count?e.enable:e.disable)("prev")}function u(e,t){x(["replace","replaceall","prev","next"],t?e.disable:e.enable)}function l(e,t){he.browser.isSafari()&&he.deviceType.isTouch()&&("find"===t||"replace"===t||"replaceall"===t)&&e.focus(t)}function s(e){me(i,a,!1),u(e,!0),c(e)}function f(e){var t,n,r=e.getData(),o=a.get();r.findtext.length?(o.text===r.findtext&&o.matchCase===r.matchcase&&o.wholeWord===r.wholewords?ee(i,a):((t=Z(i,a,r.findtext,r.matchcase,r.wholewords,r.inselection))<=0&&(n=e,i.windowManager.alert("Could not find the specified string.",function(){n.focus("findtext")})),u(e,0===t)),c(e)):s(e)}i.undoManager.add();var d=N.trim(i.selection.getContent({format:"text"})),m=a.get(),h={title:"Find and Replace",size:"normal",body:{type:"panel",items:[{type:"bar",items:[{type:"input",name:"findtext",placeholder:"Find",maximized:!0,inputMode:"search"},{type:"button",name:"prev",text:"Previous",icon:"action-prev",disabled:!0,borderless:!0},{type:"button",name:"next",text:"Next",icon:"action-next",disabled:!0,borderless:!0}]},{type:"input",name:"replacetext",placeholder:"Replace with",inputMode:"search"}]},buttons:[{type:"menu",name:"options",icon:"preferences",tooltip:"Preferences",align:"start",items:[{type:"togglemenuitem",name:"matchcase",text:"Match case"},{type:"togglemenuitem",name:"wholewords",text:"Find whole words only"},{type:"togglemenuitem",name:"inselection",text:"Find in selection"}]},{type:"custom",name:"find",text:"Find",primary:!0},{type:"custom",name:"replace",text:"Replace",disabled:!0},{type:"custom",name:"replaceall",text:"Replace all",disabled:!0}],initialData:{findtext:d,replacetext:"",wholewords:m.wholeWord,matchcase:m.matchCase,inselection:m.inSelection},onChange:function(e,t){"findtext"===t.name&&0<a.get().count&&s(e)},onAction:function(e,t){var n,r,o=e.getData();switch(t.name){case"find":f(e);break;case"replace":(re(i,a,o.replacetext)?c:s)(e);break;case"replaceall":re(i,a,o.replacetext,!0,!0),s(e);break;case"prev":te(i,a),c(e);break;case"next":ee(i,a),c(e);break;case"matchcase":case"wholewords":case"inselection":n=e.getData(),r=a.get(),a.set(v(v({},r),{matchCase:n.matchcase,wholeWord:n.wholewords,inSelection:n.inselection})),s(e)}l(e,t.name)},onSubmit:function(e){f(e),l(e,"find")},onClose:function(){i.focus(),me(i,a),i.undoManager.add()}};r.set(i.windowManager.open(h,{inline:"toolbar"}))}function ie(e,t){return function(){oe(e,t)}}"undefined"!=typeof window||Function("return this;")();function ae(e){return 3===e.dom.nodeType}function ce(e){if(null==e)throw new Error("Node cannot be null or undefined");return{dom:e}}var ue,le,se={fromHtml:function(e,t){var n=(t||document).createElement("div");if(n.innerHTML=e,!n.hasChildNodes()||1<n.childNodes.length)throw console.error("HTML does not have a single root node",e),new Error("HTML must have a single root node");return ce(n.childNodes[0])},fromTag:function(e,t){var n=(t||document).createElement(e);return ce(n)},fromText:function(e,t){var n=(t||document).createTextNode(e);return ce(n)},fromDom:ce,fromPoint:function(e,t,n){return T.from(e.dom.elementFromPoint(t,n)).map(ce)}},fe=(ue=ae,{get:function(e){if(!ue(e))throw new Error("Can only get text value of a text node");return le(e).getOr("")},getOption:le=function(e){return ue(e)?T.from(e.dom.nodeValue):T.none()},set:function(e,t){if(!ue(e))throw new Error("Can only set raw text value of a text node");e.dom.nodeValue=t}}),de=tinymce.util.Tools.resolve("tinymce.dom.TreeWalker"),me=function(e,t,n){for(var r,o,i=t.get(),a=N.toArray(e.getBody().getElementsByTagName("span")),c=0;c<a.length;c++){var u=G(a[c]);null!==u&&u.length&&(u===i.index.toString()&&(r=r||a[c].firstChild,o=a[c].firstChild),J(a[c]))}if(t.set(v(v({},i),{index:-1,count:0,text:""})),r&&o){var l=e.dom.createRng();return l.setStart(r,0),l.setEnd(o,o.data.length),!1!==n&&e.selection.setRng(l),l}},he=tinymce.util.Tools.resolve("tinymce.Env");o.add("searchreplace",function(e){var t,n,r,o,i,a=g({index:-1,count:0,text:"",matchCase:!1,wholeWord:!1,inSelection:!1}),c=a;return(t=e).addCommand("SearchReplace",function(){oe(t,c)}),(n=e).ui.registry.addMenuItem("searchreplace",{text:"Find and replace...",shortcut:"Meta+F",onAction:ie(n,r=a),icon:"search"}),n.ui.registry.addButton("searchreplace",{tooltip:"Find and replace",onAction:ie(n,r),icon:"search"}),n.shortcuts.add("Meta+F","",ie(n,r)),o=e,i=a,{done:function(e){return me(o,i,e)},find:function(e,t,n,r){return Z(o,i,e,t,n,r=void 0!==r&&r)},next:function(){return ee(o,i)},prev:function(){return te(o,i)},replace:function(e,t,n){return re(o,i,e,t,n)}}})}();
