/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.8.2 (2021-06-23)
 */
!function(){"use strict";var t=tinymce.util.Tools.resolve("tinymce.PluginManager"),u=function(){return(u=Object.assign||function(t){for(var n,r=1,e=arguments.length;r<e;r++)for(var o in n=arguments[r])Object.prototype.hasOwnProperty.call(n,o)&&(t[o]=n[o]);return t}).apply(this,arguments)};var n,r,e,o=function(e){return function(t){return r=typeof(n=t),(null===n?"null":"object"==r&&(Array.prototype.isPrototypeOf(n)||n.constructor&&"Array"===n.constructor.name)?"array":"object"==r&&(String.prototype.isPrototypeOf(n)||n.constructor&&"String"===n.constructor.name)?"string":r)===e;var n,r}},i=o("string"),f=o("object"),c=o("array"),a=function(){},s=function(t){return function(){return t}},l=function(t){return t},d=s(!1),m=s(!0),g=function(){return p},p=(n=function(t){return t.isNone()},{fold:function(t,n){return t()},is:d,isSome:d,isNone:m,getOr:e=function(t){return t},getOrThunk:r=function(t){return t()},getOrDie:function(t){throw new Error(t||"error: getOrDie called on none.")},getOrNull:s(null),getOrUndefined:s(undefined),or:e,orThunk:r,map:g,each:a,bind:g,exists:d,forall:m,filter:g,equals:n,equals_:n,toArray:function(){return[]},toString:s("none()")}),h=function(r){var t=s(r),n=function(){return o},e=function(t){return t(r)},o={fold:function(t,n){return n(r)},is:function(t){return r===t},isSome:m,isNone:d,getOr:t,getOrThunk:t,getOrDie:t,getOrNull:t,getOrUndefined:t,or:n,orThunk:n,map:function(t){return h(t(r))},each:function(t){t(r)},bind:e,exists:e,forall:e,filter:function(t){return t(r)?o:p},toArray:function(){return[r]},toString:function(){return"some("+r+")"},equals:function(t){return t.is(r)},equals_:function(t,n){return t.fold(d,function(t){return n(r,t)})}};return o},y={some:h,none:g,from:function(t){return null===t||t===undefined?p:h(t)}},v=Array.prototype.slice,b=Array.prototype.indexOf,k=function(t,n){return r=t,e=n,-1<b.call(r,e);var r,e},O=function(t,n){for(var r=t.length,e=new Array(r),o=0;o<r;o++){var a=t[o];e[o]=n(a,o)}return e},w=function(t,n){for(var r=0,e=t.length;r<e;r++){n(t[r],r)}},C=function(t,n){for(var r=[],e=0,o=t.length;e<o;e++){var a=t[e];n(a,e)&&r.push(a)}return r},E=function(t,n,r){return function(t,n){for(var r=t.length-1;0<=r;r--){n(t[r],r)}}(t,function(t){r=n(r,t)}),r},x=function(t,n){return function(t,n,r){for(var e=0,o=t.length;e<o;e++){var a=t[e];if(n(a,e))return y.some(a);if(r(a,e))break}return y.none()}(t,n,d)},R=function(t,n){for(var r=0,e=t.length;r<e;++r){if(!0!==n(t[r],r))return!1}return!0},T=function(t){return n=t,(r=0)<=r&&r<n.length?y.some(n[r]):y.none();var n,r},N=Object.keys,P=Object.hasOwnProperty,S=(function(i){if(!c(i))throw new Error("cases must be an array");if(0===i.length)throw new Error("there must be at least one case");var u=[],r={};w(i,function(t,e){var n=N(t);if(1!==n.length)throw new Error("one and only one name per case");var o=n[0],a=t[o];if(r[o]!==undefined)throw new Error("duplicate key detected:"+o);if("cata"===o)throw new Error("cannot have a case named cata (sorry)");if(!c(a))throw new Error("case arguments must be an array");u.push(o),r[o]=function(){for(var r=[],t=0;t<arguments.length;t++)r[t]=arguments[t];var n=r.length;if(n!==a.length)throw new Error("Wrong number of arguments to case "+o+". Expected "+a.length+" ("+a+"), got "+n);return{fold:function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];if(t.length!==i.length)throw new Error("Wrong number of arguments to fold. Expected "+i.length+", got "+t.length);return t[e].apply(null,r)},match:function(t){var n=N(t);if(u.length!==n.length)throw new Error("Wrong number of arguments to match. Expected: "+u.join(",")+"\nActual: "+n.join(","));if(!R(u,function(t){return k(n,t)}))throw new Error("Not all branches were specified when using match. Specified: "+n.join(", ")+"\nRequired: "+u.join(", "));return t[o].apply(null,r)},log:function(t){console.log(t,{constructors:u,constructor:o,params:r})}}}})}([{bothErrors:["error1","error2"]},{firstError:["error1","value2"]},{secondError:["value1","error2"]},{bothValues:["value1","value2"]}]),function(t){var n=[],r=[];return w(t,function(t){t.fold(function(t){n.push(t)},function(t){r.push(t)})}),{errors:n,values:r}}),M=function(r){return{is:function(t){return r===t},isValue:m,isError:d,getOr:s(r),getOrThunk:s(r),getOrDie:s(r),or:function(t){return M(r)},orThunk:function(t){return M(r)},fold:function(t,n){return n(r)},map:function(t){return M(t(r))},mapError:function(t){return M(r)},each:function(t){t(r)},bind:function(t){return t(r)},exists:function(t){return t(r)},forall:function(t){return t(r)},toOptional:function(){return y.some(r)}}},B=function(r){return{is:d,isValue:d,isError:m,getOr:l,getOrThunk:function(t){return t()},getOrDie:function(){return t=String(r),function(){throw new Error(t)}();var t},or:function(t){return t},orThunk:function(t){return t()},fold:function(t,n){return t(r)},map:function(t){return B(r)},mapError:function(t){return B(t(r))},each:a,bind:function(t){return B(r)},exists:d,forall:m,toOptional:y.none}},D={value:M,error:B,fromOption:function(t,n){return t.fold(function(){return B(n)},M)}},I=function(t){return"inline-command"===t.type||"inline-format"===t.type},A=function(t){return"block-command"===t.type||"block-format"===t.type},j=function(t){return n=t,r=function(t,n){return t.start.length===n.start.length?0:t.start.length>n.start.length?-1:1},(e=v.call(n,0)).sort(r),e;var n,r,e},_=function(o){var a=function(t){return D.error({message:t,pattern:o})},t=function(t,n,r){if(o.format===undefined)return o.cmd!==undefined?i(o.cmd)?D.value(r(o.cmd,o.value)):a(t+" pattern has non-string `cmd` parameter"):a(t+" pattern is missing both `format` and `cmd` parameters");var e=void 0;if(c(o.format)){if(!R(o.format,i))return a(t+" pattern has non-string items in the `format` array");e=o.format}else{if(!i(o.format))return a(t+" pattern has non-string `format` parameter");e=[o.format]}return D.value(n(e))};if(!f(o))return a("Raw pattern is not an object");if(!i(o.start))return a("Raw pattern is missing `start` parameter");if(o.end===undefined)return o.replacement!==undefined?i(o.replacement)?0===o.start.length?a("Replacement pattern has empty `start` parameter"):D.value({type:"inline-command",start:"",end:o.start,cmd:"mceInsertContent",value:o.replacement}):a("Replacement pattern has non-string `replacement` parameter"):0===o.start.length?a("Block pattern has empty `start` parameter"):t("Block",function(t){return{type:"block-format",start:o.start,format:t[0]}},function(t,n){return{type:"block-command",start:o.start,cmd:t,value:n}});if(!i(o.end))return a("Inline pattern has non-string `end` parameter");if(0===o.start.length&&0===o.end.length)return a("Inline pattern has empty `start` and `end` parameters");var r=o.start,e=o.end;return 0===e.length&&(e=r,r=""),t("Inline",function(t){return{type:"inline-format",start:r,end:e,format:t}},function(t,n){return{type:"inline-command",start:r,end:e,cmd:t,value:n}})},U=function(t){return"block-command"===t.type?{start:t.start,cmd:t.cmd,value:t.value}:"block-format"===t.type?{start:t.start,format:t.format}:"inline-command"===t.type?"mceInsertContent"===t.cmd&&""===t.start?{start:t.end,replacement:t.value}:{start:t.start,end:t.end,cmd:t.cmd,value:t.value}:"inline-format"===t.type?{start:t.start,end:t.end,format:1===t.format.length?t.format[0]:t.format}:void 0},q=function(t){return{inlinePatterns:C(t,I),blockPatterns:j(C(t,A))}},L=function(e){return{setPatterns:function(t){var n=S(O(t,_));if(0<n.errors.length){var r=n.errors[0];throw new Error(r.message+":\n"+JSON.stringify(r.pattern,null,2))}e.set(q(n.values))},getPatterns:function(){return function(){for(var t=0,n=0,r=arguments.length;n<r;n++)t+=arguments[n].length;for(var e=Array(t),o=0,n=0;n<r;n++)for(var a=arguments[n],i=0,u=a.length;i<u;i++,o++)e[o]=a[i];return e}(O(e.get().inlinePatterns,U),O(e.get().blockPatterns,U))}}},V="undefined"!=typeof window?window:Function("return this;")(),W=function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var r=V.console;r&&(r.error?r.error.apply(r,t):r.log.apply(r,t))},F=[{start:"*",end:"*",format:"italic"},{start:"**",end:"**",format:"bold"},{start:"#",format:"h1"},{start:"##",format:"h2"},{start:"###",format:"h3"},{start:"####",format:"h4"},{start:"#####",format:"h5"},{start:"######",format:"h6"},{start:"1. ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}],G=function(t){var n=t.getParam("forced_root_block","p");return!1===n?"":!0===n?"p":n},H=tinymce.util.Tools.resolve("tinymce.util.Delay"),J=tinymce.util.Tools.resolve("tinymce.util.VK"),K=tinymce.util.Tools.resolve("tinymce.util.Tools"),X=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),z=tinymce.util.Tools.resolve("tinymce.dom.TextSeeker"),Q=function(t,n){return{container:t,offset:n}},Y=function(t){return t.nodeType===Node.TEXT_NODE},Z=function(t,n,r){var e;n&&t.isEmpty(n)&&!r(n)&&(e=n.parentNode,t.remove(n),Z(t,e,r))},$=function(t,n,r,e){void 0===e&&(e=!0);var o=n.startContainer.parentNode,a=n.endContainer.parentNode;n.deleteContents(),e&&!r(n.startContainer)&&(Y(n.startContainer)&&0===n.startContainer.data.length&&t.remove(n.startContainer),Y(n.endContainer)&&0===n.endContainer.data.length&&t.remove(n.endContainer),Z(t,o,r),o!==a&&Z(t,a,r))},tt=function(t,n){var r=n.get(t);return c(r)&&T(r).exists(function(t){return n=t,r="block",P.call(n,r);var n,r})},nt=function(t){return 0===t.start.length},rt=function(t,n){var r=y.from(t.dom.getParent(n.startContainer,t.dom.isBlock));return""===G(t)?r.orThunk(function(){return y.some(t.getBody())}):r},et=X.DOM,ot=function(n){return function(t){return n===t?-1:0}},at=function(t,n,r){if(Y(t)&&0<=n)return y.some(Q(t,n));var e=z(et);return y.from(e.backwards(t,n,ot(t),r)).map(function(t){return Q(t.container,t.container.data.length)})},it=function(t,r,e){if(!Y(t))return y.none();var n=t.textContent;if(0<=r&&r<=n.length)return y.some(Q(t,r));var o=z(et);return y.from(o.backwards(t,r,ot(t),e)).bind(function(t){var n=t.container.data;return it(t.container,r+n.length,e)})},ut=function(t,n,r){if(!Y(t))return y.none();var e=t.textContent;if(n<=e.length)return y.some(Q(t,n));var o=z(et);return y.from(o.forwards(t,n,ot(t),r)).bind(function(t){return ut(t.container,n-e.length,r)})},ft=function(t,n,r,e,o){var a,i=z(t,(a=t,function(t){return a.isBlock(t)||k(["BR","IMG","HR","INPUT"],t.nodeName)||"false"===a.getContentEditable(t)}));return y.from(i.backwards(n,r,e,o))},ct=function(t,n,r){if(Y(n)&&(r<0||r>n.data.length))return[];for(var e=[r],o=n;o!==t&&o.parentNode;){for(var a=o.parentNode,i=0;i<a.childNodes.length;i++)if(a.childNodes[i]===o){e.push(i);break}o=a}return o===t?e.reverse():[]},st=function(t,n,r,e,o){return{start:ct(t,n,r),end:ct(t,e,o)}},lt=function(t,n){var r,e,o,a=n.slice(),i=a.pop();return(r=a,e=function(t,n){return t.bind(function(t){return y.from(t.childNodes[n])})},o=y.some(t),w(r,function(t){o=e(o,t)}),o).bind(function(t){return Y(t)&&(i<0||i>t.data.length)?y.none():y.some({node:t,offset:i})})},dt=function(n,r){return lt(n,r.start).bind(function(t){var o=t.node,a=t.offset;return lt(n,r.end).map(function(t){var n=t.node,r=t.offset,e=document.createRange();return e.setStart(o,a),e.setEnd(n,r),e})})},mt=function(e,o,n){(function(t,n,r){if(Y(t)&&n>=t.length)return y.some(Q(t,n));var e=z(et);return y.from(e.forwards(t,n,ot(t),r)).map(function(t){return Q(t.container,0)})})(o,0,o).each(function(t){var r=t.container;ut(r,n.start.length,o).each(function(t){var n=e.createRng();n.setStart(r,0),n.setEnd(t.container,t.offset),$(e,n,function(t){return t===o})})})},gt=function(e,a){var i=e.dom,t=e.selection.getRng();return rt(e,t).filter(function(t){var n=G(e),r=""===n&&i.is(t,"body")||i.is(t,n);return null!==t&&r}).bind(function(n){var t,r,e,o=n.textContent;return(t=a,e=(r=o).replace("\xa0"," "),x(t,function(t){return 0===r.indexOf(t.start)||0===e.indexOf(t.start)})).map(function(t){return K.trim(o).length===t.start.length?[]:[{pattern:t,range:st(i.getRoot(),n,0,n,0)}]})}).getOr([])},pt=function(i,t){var n;0!==t.length&&(n=i.selection.getBookmark(),w(t,function(t){return r=t,e=(n=i).dom,o=r.pattern,a=dt(e.getRoot(),r.range).getOrDie("Unable to resolve path range"),rt(n,a).each(function(t){"block-format"===o.type?tt(o.format,n.formatter)&&n.undoManager.transact(function(){mt(n.dom,t,o),n.formatter.apply(o.format)}):"block-command"===o.type&&n.undoManager.transact(function(){mt(n.dom,t,o),n.execCommand(o.cmd,!1,o.value)})}),1;var n,r,e,o,a}),i.selection.moveToBookmark(n))},ht=0,vt=function(t,n){return t.create("span",{"data-mce-type":"bookmark",id:n})},yt=function(t,n){var r=t.createRng();return r.setStartAfter(n.start),r.setEndBefore(n.end),r},bt=function(t,n,r){var e=dt(t.getRoot(),r).getOrDie("Unable to resolve path range"),o=e.startContainer,a=e.endContainer,i=0===e.endOffset?a:a.splitText(e.endOffset),u=0===e.startOffset?o:o.splitText(e.startOffset);return{prefix:n,end:i.parentNode.insertBefore(vt(t,n+"-end"),i),start:u.parentNode.insertBefore(vt(t,n+"-start"),u)}},kt=function(t,n,r){Z(t,t.get(n.prefix+"-end"),r),Z(t,t.get(n.prefix+"-start"),r)},Ot=function(e,o,a,t){var i,u=o.start;return ft(e,t.container,t.offset,(i=u,function(t,n){var r=t.data.substring(0,n),e=r.lastIndexOf(i.charAt(i.length-1)),o=r.lastIndexOf(i);return-1!==o?o+i.length:-1!==e?e+1:-1}),a).bind(function(r){if(r.offset>=u.length){var t=e.createRng();return t.setStart(r.container,r.offset-u.length),t.setEnd(r.container,r.offset),y.some(t)}var n=r.offset-u.length;return it(r.container,n,a).map(function(t){var n=e.createRng();return n.setStart(t.container,t.offset),n.setEnd(r.container,r.offset),n}).filter(function(t){return t.toString()===u}).orThunk(function(){return Ot(e,o,a,Q(r.container,0))})})},wt=function(a,i,u){var f=a.dom,c=f.getRoot(),s=u.pattern,l=u.position.container,d=u.position.offset;return it(l,d-u.pattern.end.length,i).bind(function(t){var e=st(c,t.container,t.offset,l,d);if(nt(s))return y.some({matches:[{pattern:s,startRng:e,endRng:e}],position:t});var n=Ct(a,u.remainingPatterns,t.container,t.offset,i),o=n.getOr({matches:[],position:t}),r=o.position;return function(t,r,n,e,o,a){if(void 0===a&&(a=!1),0!==r.start.length||a)return at(n,e,o).bind(function(n){return Ot(t,r,o,n).bind(function(t){if(a){if(t.endContainer===n.container&&t.endOffset===n.offset)return y.none();if(0===n.offset&&t.endContainer.textContent.length===t.endOffset)return y.none()}return y.some(t)})});var i=t.createRng();return i.setStart(n,e),i.setEnd(n,e),y.some(i)}(f,s,r.container,r.offset,i,n.isNone()).map(function(t){var n,r=st(c,(n=t).startContainer,n.startOffset,n.endContainer,n.endOffset);return{matches:o.matches.concat([{pattern:s,startRng:r,endRng:e}]),position:Q(t.startContainer,t.startOffset)}})})},Ct=function(d,m,g,p,h){var v=d.dom;return at(g,p,v.getRoot()).bind(function(t){var n=v.createRng();n.setStart(h,0),n.setEnd(g,p);for(var r,e,o,a,i,u=n.toString(),f=0;f<m.length;f++){var c=m[f];if(r=u,e=c.end,i=a=o=void 0,a=e,i=(o=r).length-e.length,""===a||o.length>=a.length&&o.substr(i,i+a.length)===a){var s=m.slice();s.splice(f,1);var l=wt(d,h,{pattern:c,remainingPatterns:s,position:t});if(l.isSome())return l}}return y.none()})},Et=function(n,t,r){n.selection.setRng(r),"inline-format"===t.type?w(t.format,function(t){n.formatter.apply(t)}):n.execCommand(t.cmd,!1,t.value)},xt=function(o,t){var n,r,a=(n="mce_textpattern",r=(new Date).getTime(),n+"_"+Math.floor(1e9*Math.random())+ ++ht+String(r)),i=E(t,function(t,n){var r=bt(o,a+"_end"+t.length,n.endRng);return t.concat([u(u({},n),{endMarker:r})])},[]);return E(i,function(t,n){var r=i.length-t.length-1,e=nt(n.pattern)?n.endMarker:bt(o,a+"_start"+r,n.startRng);return t.concat([u(u({},n),{startMarker:e})])},[])},Rt=function(r,e,o){var a=r.selection.getRng();return!1===a.collapsed?[]:rt(r,a).bind(function(t){var n=a.startOffset-(o?1:0);return Ct(r,e,a.startContainer,n,t)}).fold(function(){return[]},function(t){return t.matches})},Tt=function(f,t){var c,n,r;0!==t.length&&(c=f.dom,n=f.selection.getBookmark(),r=xt(c,t),w(r,function(t){var n,r,e,o,a,i=c.getParent(t.startMarker.start,c.isBlock),u=function(t){return t===i};nt(t.pattern)?(n=f,r=t.pattern,e=t.endMarker,o=u,a=yt(n.dom,e),$(n.dom,a,o),Et(n,r,a)):function(t,n,r,e,o){var a=t.dom,i=yt(a,e),u=yt(a,r);$(a,u,o),$(a,i,o);var f={prefix:r.prefix,start:r.end,end:e.start},c=yt(a,f);Et(t,n,c)}(f,t.pattern,t.startMarker,t.endMarker,u),kt(c,t.endMarker,u),kt(c,t.startMarker,u)}),f.selection.moveToBookmark(n))},Nt=function(t,n){var r=Rt(t,n.inlinePatterns,!0);0<r.length&&t.undoManager.transact(function(){Tt(t,r)})},Pt=function(t,n,r){for(var e=0;e<t.length;e++)if(r(t[e],n))return!0},St=function(n,r){var e=[",",".",";",":","!","?"],o=[32];n.on("keydown",function(t){13!==t.keyCode||J.modifierPressed(t)||!function(r,t){if(!r.selection.isCollapsed())return!1;var e=Rt(r,t.inlinePatterns,!1),o=gt(r,t.blockPatterns);return(0<o.length||0<e.length)&&(r.undoManager.add(),r.undoManager.extra(function(){r.execCommand("mceInsertNewLine")},function(){r.insertContent("\ufeff"),Tt(r,e),pt(r,o);var t=r.selection.getRng(),n=at(t.startContainer,t.startOffset,r.dom.getRoot());r.execCommand("mceInsertNewLine"),n.each(function(t){var n=t.container;"\ufeff"===n.data.charAt(t.offset-1)&&(n.deleteData(t.offset-1,1),Z(r.dom,n.parentNode,function(t){return t===r.dom.getRoot()}))})}),!0)}(n,r.get())||t.preventDefault()},!0),n.on("keyup",function(t){Pt(o,t,function(t,n){return t===n.keyCode&&!1===J.modifierPressed(n)})&&Nt(n,r.get())}),n.on("keypress",function(t){Pt(e,t,function(t,n){return t.charCodeAt(0)===n.charCode})&&H.setEditorTimeout(n,function(){Nt(n,r.get())})})};t.add("textpattern",function(t){var n,r,e=(n=function(t){var n=t.getParam("textpattern_patterns",F,"array");if(!c(n))return W("The setting textpattern_patterns should be an array"),{inlinePatterns:[],blockPatterns:[]};var r=S(O(n,_));return w(r.errors,function(t){return W(t.message,t.pattern),0}),q(r.values)}(t),r=n,{get:function(){return r},set:function(t){r=t}});return St(t,e),L(e)})}();
