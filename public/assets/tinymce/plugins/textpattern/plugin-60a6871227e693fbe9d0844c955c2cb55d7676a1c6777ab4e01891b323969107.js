!function(){"use strict";function a(t,n,r){if(r||2===arguments.length)for(var e,o=0,a=n.length;o<a;o++)!e&&o in n||((e=e||Array.prototype.slice.call(n,0,o))[o]=n[o]);return t.concat(e||Array.prototype.slice.call(n))}function t(e){return function(t){return r=typeof(n=t),(null===n?"null":"object"==r&&(Array.prototype.isPrototypeOf(n)||n.constructor&&"Array"===n.constructor.name)?"array":"object"==r&&(String.prototype.isPrototypeOf(n)||n.constructor&&"String"===n.constructor.name)?"string":r)===e;var n,r}}function r(){}function i(t){return function(){return t}}function e(t){return t}function n(){return Z}function o(t){return t()}function d(t,n){return-1<rt.call(t,n)}function u(t,n){for(var r=t.length,e=new Array(r),o=0;o<r;o++){var a=t[o];e[o]=n(a,o)}return e}function f(t,n){for(var r=0,e=t.length;r<e;r++)n(t[r],r)}function c(t,n){for(var r=[],e=0,o=t.length;e<o;e++){var a=t[e];n(a,e)&&r.push(a)}return r}function s(t,e,o){return function(t){for(var n,r=t.length-1;0<=r;r--)n=t[r],o=e(o,n,r)}(t),o}function l(t,n){for(var r=0,e=t.length;r<e;++r)if(!0!==n(t[r],r))return;return 1}function m(t){var n=[],r=[];return f(t,function(t){t.fold(function(t){n.push(t)},function(t){r.push(t)})}),{errors:n,values:r}}function g(t){return"inline-command"===t.type||"inline-format"===t.type}function p(t){return"block-command"===t.type||"block-format"===t.type}function h(o){function a(t){return ut.error({message:t,pattern:o})}function t(t,n,r){if(void 0===o.format)return void 0!==o.cmd?K(o.cmd)?ut.value(r(o.cmd,o.value)):a(t+" pattern has non-string `cmd` parameter"):a(t+" pattern is missing both `format` and `cmd` parameters");var e=void 0;if(z(o.format)){if(!l(o.format,K))return a(t+" pattern has non-string items in the `format` array");e=o.format}else{if(!K(o.format))return a(t+" pattern has non-string `format` parameter");e=[o.format]}return ut.value(n(e))}if(!X(o))return a("Raw pattern is not an object");if(!K(o.start))return a("Raw pattern is missing `start` parameter");if(void 0===o.end)return void 0!==o.replacement?K(o.replacement)?0===o.start.length?a("Replacement pattern has empty `start` parameter"):ut.value({type:"inline-command",start:"",end:o.start,cmd:"mceInsertContent",value:o.replacement}):a("Replacement pattern has non-string `replacement` parameter"):0===o.start.length?a("Block pattern has empty `start` parameter"):t("Block",function(t){return{type:"block-format",start:o.start,format:t[0]}},function(t,n){return{type:"block-command",start:o.start,cmd:t,value:n}});if(!K(o.end))return a("Inline pattern has non-string `end` parameter");if(0===o.start.length&&0===o.end.length)return a("Inline pattern has empty `start` and `end` parameters");var r=o.start,e=o.end;return 0===e.length&&(e=r,r=""),t("Inline",function(t){return{type:"inline-format",start:r,end:e,format:t}},function(t,n){return{type:"inline-command",start:r,end:e,cmd:t,value:n}})}function v(t){return"block-command"===t.type?{start:t.start,cmd:t.cmd,value:t.value}:"block-format"===t.type?{start:t.start,format:t.format}:"inline-command"===t.type?"mceInsertContent"===t.cmd&&""===t.start?{start:t.end,replacement:t.value}:{start:t.start,end:t.end,cmd:t.cmd,value:t.value}:"inline-format"===t.type?{start:t.start,end:t.end,format:1===t.format.length?t.format[0]:t.format}:void 0}function y(t){return{inlinePatterns:c(t,g),blockPatterns:(n=c(t,p),r=function(t,n){return t.start.length===n.start.length?0:t.start.length>n.start.length?-1:1},(e=nt.call(n,0)).sort(r),e)};var n,r,e}function b(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var r=ft.console;r&&(r.error||r.log).apply(r,t)}function k(t){var n=t.getParam("forced_root_block","p");return!1===n?"":!0===n?"p":n}function O(t,n){return{container:t,offset:n}}function w(t){return t.nodeType===Node.TEXT_NODE}function C(t,n,r,e){void 0===e&&(e=!0);var o=n.startContainer.parentNode,a=n.endContainer.parentNode;n.deleteContents(),e&&!r(n.startContainer)&&(w(n.startContainer)&&0===n.startContainer.data.length&&t.remove(n.startContainer),w(n.endContainer)&&0===n.endContainer.data.length&&t.remove(n.endContainer),pt(t,o,r),o!==a&&pt(t,a,r))}function E(t,n){var r,e=n.get(t);return z(e)&&(0<(r=e).length?tt.some(r[0]):tt.none()).exists(function(t){return ot.call(t,"block")})}function x(t){return 0===t.start.length}function R(t,n){var r=tt.from(t.dom.getParent(n.startContainer,t.dom.isBlock));return""===k(t)?r.orThunk(function(){return tt.some(t.getBody())}):r}function T(n){return function(t){return n===t?-1:0}}function P(t,n,r){if(w(t)&&0<=n)return tt.some(O(t,n));var e=gt(ht);return tt.from(e.backwards(t,n,T(t),r)).map(function(t){return O(t.container,t.container.data.length)})}function N(t,n,r){if(w(n)&&(r<0||r>n.data.length))return[];for(var e=[r],o=n;o!==t&&o.parentNode;){for(var a=o.parentNode,i=0;i<a.childNodes.length;i++)if(a.childNodes[i]===o){e.push(i);break}o=a}return o===t?e.reverse():[]}function S(t,n,r,e,o){return{start:N(t,n,r),end:N(t,e,o)}}function M(t,n){var r=n.slice(),e=r.pop(),o=r,a=function(t,n){return t.bind(function(t){return tt.from(t.childNodes[n])})},i=tt.some(t);return f(o,function(t){i=a(i,t)}),i.bind(function(t){return w(t)&&(e<0||e>t.data.length)?tt.none():tt.some({node:t,offset:e})})}function A(n,r){return M(n,r.start).bind(function(t){var o=t.node,a=t.offset;return M(n,r.end).map(function(t){var n=t.node,r=t.offset,e=document.createRange();return e.setStart(o,a),e.setEnd(n,r),e})})}function B(e,o,n){(function(t,n){if(w(t)&&t.length<=0)return tt.some(O(t,0));var r=gt(ht);return tt.from(r.forwards(t,0,T(t),n)).map(function(t){return O(t.container,0)})})(o,o).each(function(t){var r=t.container;yt(r,n.start.length,o).each(function(t){var n=e.createRng();n.setStart(r,0),n.setEnd(t.container,t.offset),C(e,n,function(t){return t===o})})})}function D(e,a){var i=e.dom,t=e.selection.getRng();return R(e,t).filter(function(t){var n=k(e),r=""===n&&i.is(t,"body")||i.is(t,n);return null!==t&&r}).bind(function(n){var r,e=n.textContent,t=a,o=(r=e).replace("\xa0"," ");return function(t,n,r){for(var e=0,o=t.length;e<o;e++){var a=t[e];if(n(a,e))return tt.some(a);if(r(a,e))break}return tt.none()}(t,function(t){return 0===r.indexOf(t.start)||0===o.indexOf(t.start)},Q).map(function(t){return dt.trim(e).length===t.start.length?[]:[{pattern:t,range:S(i.getRoot(),n,0,n,0)}]})}).getOr([])}function I(t,n){return t.create("span",{"data-mce-type":"bookmark",id:n})}function j(t,n){var r=t.createRng();return r.setStartAfter(n.start),r.setEndBefore(n.end),r}function _(t,n,r){var e=A(t.getRoot(),r).getOrDie("Unable to resolve path range"),o=e.startContainer,a=e.endContainer,i=0===e.endOffset?a:a.splitText(e.endOffset),u=0===e.startOffset?o:o.splitText(e.startOffset);return{prefix:n,end:i.parentNode.insertBefore(I(t,n+"-end"),i),start:u.parentNode.insertBefore(I(t,n+"-start"),u)}}function U(t,n,r){pt(t,t.get(n.prefix+"-end"),r),pt(t,t.get(n.prefix+"-start"),r)}function L(n,t,r){n.selection.setRng(r),"inline-format"===t.type?f(t.format,function(t){n.formatter.apply(t)}):n.execCommand(t.cmd,!1,t.value)}function V(r,e,o){var a=r.selection.getRng();return!1===a.collapsed?[]:R(r,a).bind(function(t){var n=a.startOffset-(o?1:0);return Ot(r,e,a.startContainer,n,t)}).fold(function(){return[]},function(t){return t.matches})}function W(p,t){var h,n,o,r,e,a,i;0!==t.length&&(h=p.dom,n=p.selection.getBookmark(),o=h,r=t,e=(new Date).getTime(),a="mce_textpattern_"+Math.floor(1e9*Math.random())+ ++bt+String(e),f(s(i=s(r,function(t,n){var r=_(o,a+"_end"+t.length,n.endRng);return t.concat([J(J({},n),{endMarker:r})])},[]),function(t,n){var r=i.length-t.length-1,e=x(n.pattern)?n.endMarker:_(o,a+"_start"+r,n.startRng);return t.concat([J(J({},n),{startMarker:e})])},[]),function(t){function n(t){return t===g}var r,e,o,a,i,u,f,c,s,l,d,m,g=h.getParent(t.startMarker.start,h.isBlock);x(t.pattern)?(e=t.pattern,o=t.endMarker,a=n,i=j((r=p).dom,o),C(r.dom,i,a),L(r,e,i)):(u=p,f=t.pattern,c=t.startMarker,s=t.endMarker,l=n,m=j(d=u.dom,s),C(d,j(d,c),l),C(d,m,l),L(u,f,j(d,{prefix:c.prefix,start:c.end,end:s.start}))),U(h,t.endMarker,n),U(h,t.startMarker,n)}),p.selection.moveToBookmark(n))}function q(t,n){var r=V(t,n.inlinePatterns,!0);0<r.length&&t.undoManager.transact(function(){W(t,r)})}function F(t,n,r){for(var e=0;e<t.length;e++)if(r(t[e],n))return 1}function G(n,r){var e=[",",".",";",":","!","?"],o=[32];n.on("keydown",function(t){13!==t.keyCode||lt.modifierPressed(t)||!function(o,t){if(o.selection.isCollapsed()){var a=V(o,t.inlinePatterns,!1),u=D(o,t.blockPatterns);return(0<u.length||0<a.length)&&(o.undoManager.add(),o.undoManager.extra(function(){o.execCommand("mceInsertNewLine")},function(){var i,t,n;o.insertContent("\ufeff"),W(o,a),i=o,0!==(t=u).length&&(n=i.selection.getBookmark(),f(t,function(t){return e=(n=i).dom,o=(r=t).pattern,a=A(e.getRoot(),r.range).getOrDie("Unable to resolve path range"),R(n,a).each(function(t){"block-format"===o.type?E(o.format,n.formatter)&&n.undoManager.transact(function(){B(n.dom,t,o),n.formatter.apply(o.format)}):"block-command"===o.type&&n.undoManager.transact(function(){B(n.dom,t,o),n.execCommand(o.cmd,!1,o.value)})}),1;var n,r,e,o,a}),i.selection.moveToBookmark(n));var r=o.selection.getRng(),e=P(r.startContainer,r.startOffset,o.dom.getRoot());o.execCommand("mceInsertNewLine"),e.each(function(t){var n=t.container;"\ufeff"===n.data.charAt(t.offset-1)&&(n.deleteData(t.offset-1,1),pt(o.dom,n.parentNode,function(t){return t===o.dom.getRoot()}))})}),1)}}(n,r.get())||t.preventDefault()},!0),n.on("keyup",function(t){F(o,t,function(t,n){return t===n.keyCode&&!1===lt.modifierPressed(n)})&&q(n,r.get())}),n.on("keypress",function(t){F(e,t,function(t,n){return t.charCodeAt(0)===n.charCode})&&st.setEditorTimeout(n,function(){q(n,r.get())})})}var H=tinymce.util.Tools.resolve("tinymce.PluginManager"),J=function(){return(J=Object.assign||function(t){for(var n,r=1,e=arguments.length;r<e;r++)for(var o in n=arguments[r])Object.prototype.hasOwnProperty.call(n,o)&&(t[o]=n[o]);return t}).apply(this,arguments)},K=t("string"),X=t("object"),z=t("array"),Q=i(!1),Y=i(!0),Z={fold:function(t){return t()},isSome:Q,isNone:Y,getOr:e,getOrThunk:o,getOrDie:function(t){throw new Error(t||"error: getOrDie called on none.")},getOrNull:i(null),getOrUndefined:i(void 0),or:e,orThunk:o,map:n,each:r,bind:n,exists:Q,forall:Y,filter:function(){return Z},toArray:function(){return[]},toString:i("none()")},$=function(r){function t(){return o}function n(t){return t(r)}var e=i(r),o={fold:function(t,n){return n(r)},isSome:Y,isNone:Q,getOr:e,getOrThunk:e,getOrDie:e,getOrNull:e,getOrUndefined:e,or:t,orThunk:t,map:function(t){return $(t(r))},each:function(t){t(r)},bind:n,exists:n,forall:n,filter:function(t){return t(r)?o:Z},toArray:function(){return[r]},toString:function(){return"some("+r+")"}};return o},tt={some:$,none:n,from:function(t){return null==t?Z:$(t)}},nt=Array.prototype.slice,rt=Array.prototype.indexOf,et=Object.keys,ot=Object.hasOwnProperty;!function(i){if(!z(i))throw new Error("cases must be an array");if(0===i.length)throw new Error("there must be at least one case");var u=[],r={};f(i,function(t,e){var n=et(t);if(1!==n.length)throw new Error("one and only one name per case");var o=n[0],a=t[o];if(void 0!==r[o])throw new Error("duplicate key detected:"+o);if("cata"===o)throw new Error("cannot have a case named cata (sorry)");if(!z(a))throw new Error("case arguments must be an array");u.push(o),r[o]=function(){for(var r=[],t=0;t<arguments.length;t++)r[t]=arguments[t];var n=r.length;if(n!==a.length)throw new Error("Wrong number of arguments to case "+o+". Expected "+a.length+" ("+a+"), got "+n);return{fold:function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];if(t.length!==i.length)throw new Error("Wrong number of arguments to fold. Expected "+i.length+", got "+t.length);return t[e].apply(null,r)},match:function(t){var n=et(t);if(u.length!==n.length)throw new Error("Wrong number of arguments to match. Expected: "+u.join(",")+"\nActual: "+n.join(","));if(!l(u,function(t){return d(n,t)}))throw new Error("Not all branches were specified when using match. Specified: "+n.join(", ")+"\nRequired: "+u.join(", "));return t[o].apply(null,r)},log:function(t){console.log(t,{constructors:u,constructor:o,params:r})}}}})}([{bothErrors:["error1","error2"]},{firstError:["error1","value2"]},{secondError:["value1","error2"]},{bothValues:["value1","value2"]}]);var at=function(r){return{isValue:Y,isError:Q,getOr:i(r),getOrThunk:i(r),getOrDie:i(r),or:function(){return at(r)},orThunk:function(){return at(r)},fold:function(t,n){return n(r)},map:function(t){return at(t(r))},mapError:function(){return at(r)},each:function(t){t(r)},bind:function(t){return t(r)},exists:function(t){return t(r)},forall:function(t){return t(r)},toOptional:function(){return tt.some(r)}}},it=function(n){return{isValue:Q,isError:Y,getOr:e,getOrThunk:function(t){return t()},getOrDie:function(){return t=String(n),function(){throw new Error(t)}();var t},or:e,orThunk:function(t){return t()},fold:function(t){return t(n)},map:function(){return it(n)},mapError:function(t){return it(t(n))},each:r,bind:function(){return it(n)},exists:Q,forall:Y,toOptional:tt.none}},ut={value:at,error:it,fromOption:function(t,n){return t.fold(function(){return it(n)},at)}},ft="undefined"!=typeof window?window:Function("return this;")(),ct=[{start:"*",end:"*",format:"italic"},{start:"**",end:"**",format:"bold"},{start:"#",format:"h1"},{start:"##",format:"h2"},{start:"###",format:"h3"},{start:"####",format:"h4"},{start:"#####",format:"h5"},{start:"######",format:"h6"},{start:"1. ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}],st=tinymce.util.Tools.resolve("tinymce.util.Delay"),lt=tinymce.util.Tools.resolve("tinymce.util.VK"),dt=tinymce.util.Tools.resolve("tinymce.util.Tools"),mt=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),gt=tinymce.util.Tools.resolve("tinymce.dom.TextSeeker"),pt=function(t,n,r){var e;n&&t.isEmpty(n)&&!r(n)&&(e=n.parentNode,t.remove(n),pt(t,e,r))},ht=mt.DOM,vt=function(t,r,e){if(!w(t))return tt.none();var n=t.textContent;if(0<=r&&r<=n.length)return tt.some(O(t,r));var o=gt(ht);return tt.from(o.backwards(t,r,T(t),e)).bind(function(t){var n=t.container.data;return vt(t.container,r+n.length,e)})},yt=function(t,n,r){if(!w(t))return tt.none();var e=t.textContent;if(n<=e.length)return tt.some(O(t,n));var o=gt(ht);return tt.from(o.forwards(t,n,T(t),r)).bind(function(t){return yt(t.container,n-e.length,r)})},bt=0,kt=function(e,o,a,t){var i,n,r,u,f,c,s,l=o.start;return n=t.container,r=t.offset,i=l,u=function(t,n){var r=t.data.substring(0,n),e=r.lastIndexOf(i.charAt(i.length-1)),o=r.lastIndexOf(i);return-1!==o?o+i.length:-1!==e?e+1:-1},f=a,s=gt(e,(c=e,function(t){return c.isBlock(t)||d(["BR","IMG","HR","INPUT"],t.nodeName)||"false"===c.getContentEditable(t)})),tt.from(s.backwards(n,r,u,f)).bind(function(r){if(r.offset>=l.length){var t=e.createRng();return t.setStart(r.container,r.offset-l.length),t.setEnd(r.container,r.offset),tt.some(t)}var n=r.offset-l.length;return vt(r.container,n,a).map(function(t){var n=e.createRng();return n.setStart(t.container,t.offset),n.setEnd(r.container,r.offset),n}).filter(function(t){return t.toString()===l}).orThunk(function(){return kt(e,o,a,O(r.container,0))})})},Ot=function(l,d,m,g,p){var h=l.dom;return P(m,g,h.getRoot()).bind(function(t){var n=h.createRng();n.setStart(p,0),n.setEnd(m,g);for(var r,e=n.toString(),o=0;o<d.length;o++){var a,i,u=d[o],f=u.end;if(i=r=void 0,a=(r=e).length-f.length,""===(i=f)||r.length>=i.length&&r.substr(a,a+i.length)===i){var c=d.slice();c.splice(o,1);var s=function(a,i,u){var f=a.dom,c=f.getRoot(),s=u.pattern,l=u.position.container,d=u.position.offset;return vt(l,d-u.pattern.end.length,i).bind(function(t){var r=S(c,t.container,t.offset,l,d);if(x(s))return tt.some({matches:[{pattern:s,startRng:r,endRng:r}],position:t});var n=Ot(a,u.remainingPatterns,t.container,t.offset,i),e=n.getOr({matches:[],position:t}),o=e.position;return function(t,r,n,e,o,a){if(void 0===a&&(a=!1),0!==r.start.length||a)return P(n,e,o).bind(function(n){return kt(t,r,o,n).bind(function(t){if(a){if(t.endContainer===n.container&&t.endOffset===n.offset)return tt.none();if(0===n.offset&&t.endContainer.textContent.length===t.endOffset)return tt.none()}return tt.some(t)})});var i=t.createRng();return i.setStart(n,e),i.setEnd(n,e),tt.some(i)}(f,s,o.container,o.offset,i,n.isNone()).map(function(t){var n=S(c,t.startContainer,t.startOffset,t.endContainer,t.endOffset);return{matches:e.matches.concat([{pattern:s,startRng:n,endRng:r}]),position:O(t.startContainer,t.startOffset)}})})}(l,p,{pattern:u,remainingPatterns:c,position:t});if(s.isSome())return s}}return tt.none()})};H.add("textpattern",function(r){var t,n,e,o=(t=function(){var t=r.getParam("textpattern_patterns",ct,"array");if(!z(t))return b("The setting textpattern_patterns should be an array"),{inlinePatterns:[],blockPatterns:[]};var n=m(u(t,h));return f(n.errors,function(t){return b(t.message,t.pattern),0}),y(n.values)}(),n=t,{get:function(){return n},set:function(t){n=t}});return G(r,o),e=o,{setPatterns:function(t){var n=m(u(t,h));if(0<n.errors.length){var r=n.errors[0];throw new Error(r.message+":\n"+JSON.stringify(r.pattern,null,2))}e.set(y(n.values))},getPatterns:function(){return a(a([],u(e.get().inlinePatterns,v),!0),u(e.get().blockPatterns,v),!0)}}})}();