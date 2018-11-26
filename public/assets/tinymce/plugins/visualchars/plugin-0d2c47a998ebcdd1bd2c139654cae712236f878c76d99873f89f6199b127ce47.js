!function(){"use strict";var n,e,t,r,o,u=function(n){var e=n,t=function(){return e};return{get:t,set:function(n){e=n},clone:function(){return u(t())}}},i=tinymce.util.Tools.resolve("tinymce.PluginManager"),c=function(n){return{isEnabled:function(){return n.get()}}},a=function(n,e){return n.fire("VisualChars",{state:e})},f={"\xa0":"nbsp","\xad":"shy"},l=function(n,e){var t,r="";for(t in n)r+=t;return new RegExp("["+r+"]",e?"g":"")},d=function(n){var e,t="";for(e in n)t&&(t+=","),t+="span.mce-"+n[e];return t},s={charMap:f,regExp:l(f),regExpGlobal:l(f,!0),selector:d(f),charMapToRegExp:l,charMapToSelector:d},m=function(n){return function(){return n}},N=m(!1),E=m(!0),T=N,O=E,v=function(){return g},g=(r={fold:function(n){return n()},is:T,isSome:T,isNone:O,getOr:t=function(n){return n},getOrThunk:e=function(n){return n()},getOrDie:function(n){throw new Error(n||"error: getOrDie called on none.")},getOrNull:function(){return null},getOrUndefined:function(){return undefined},or:t,orThunk:e,map:v,ap:v,each:function(){},bind:v,flatten:v,exists:T,forall:O,filter:v,equals:n=function(n){return n.isNone()},equals_:n,toArray:function(){return[]},toString:m("none()")},Object.freeze&&Object.freeze(r),r),h=function(t){var n=function(){return t},e=function(){return o},r=function(n){return n(t)},o={fold:function(n,e){return e(t)},is:function(n){return t===n},isSome:O,isNone:T,getOr:n,getOrThunk:n,getOrDie:n,getOrNull:n,getOrUndefined:n,or:e,orThunk:e,map:function(n){return h(n(t))},ap:function(n){return n.fold(v,function(n){return h(n(t))})},each:function(n){n(t)},bind:r,flatten:n,exists:r,forall:r,filter:function(n){return n(t)?o:g},equals:function(n){return n.is(t)},equals_:function(n,e){return n.fold(T,function(n){return e(t,n)})},toArray:function(){return[t]},toString:function(){return"some("+t+")"}};return o},p=function(n){return null===n||n===undefined?g:h(n)},C=(o="function",function(n){return function(n){if(null===n)return"null";var e=typeof n;return"object"===e&&Array.prototype.isPrototypeOf(n)?"array":"object"===e&&String.prototype.isPrototypeOf(n)?"string":e}(n)===o}),D=function(n,e){for(var t=0,r=n.length;t<r;t++)e(n[t],t,n)},M=(Array.prototype.slice,C(Array.from)&&Array.from,function(n){if(null===n||n===undefined)throw new Error("Node cannot be null or undefined");return{dom:m(n)}}),y={fromHtml:function(n,e){var t=(e||document).createElement("div");if(t.innerHTML=n,!t.hasChildNodes()||1<t.childNodes.length)throw console.error("HTML does not have a single root node",n),"HTML must have a single root node";return M(t.childNodes[0])},fromTag:function(n,e){var t=(e||document).createElement(n);return M(t)},fromText:function(n,e){var t=(e||document).createTextNode(n);return M(t)},fromDom:M,fromPoint:function(n,e,t){var r=n.dom();return p(r.elementFromPoint(e,t)).map(M)}},_={ATTRIBUTE:Node.ATTRIBUTE_NODE,CDATA_SECTION:Node.CDATA_SECTION_NODE,COMMENT:Node.COMMENT_NODE,DOCUMENT:Node.DOCUMENT_NODE,DOCUMENT_TYPE:Node.DOCUMENT_TYPE_NODE,DOCUMENT_FRAGMENT:Node.DOCUMENT_FRAGMENT_NODE,ELEMENT:Node.ELEMENT_NODE,TEXT:Node.TEXT_NODE,PROCESSING_INSTRUCTION:Node.PROCESSING_INSTRUCTION_NODE,ENTITY_REFERENCE:Node.ENTITY_REFERENCE_NODE,ENTITY:Node.ENTITY_NODE,NOTATION:Node.NOTATION_NODE},A=function(n){return n.dom().nodeName.toLowerCase()},S=function(n){return n.dom().nodeType},b=function(e){return function(n){return S(n)===e}},I=b(_.ELEMENT),R=b(_.TEXT),k=b(_.DOCUMENT),x={name:A,type:S,value:function(n){return n.dom().nodeValue},isElement:I,isText:R,isDocument:k,isComment:function(n){return S(n)===_.COMMENT||"#comment"===A(n)}},P=function(n){return'<span data-mce-bogus="1" class="mce-'+s.charMap[n]+'">'+n+"</span>"},U=function(n,e){var t=[],r=function(n,e){for(var t=n.length,r=new Array(t),o=0;o<t;o++){var u=n[o];r[o]=e(u,o,n)}return r}(n.dom().childNodes,y.fromDom);return D(r,function(n){e(n)&&(t=t.concat([n])),t=t.concat(U(n,e))}),t},w={isMatch:function(n){return x.isText(n)&&x.value(n)!==undefined&&s.regExp.test(x.value(n))},filterDescendants:U,findParentElm:function(n,e){for(;n.parentNode;){if(n.parentNode===e)return n;n=n.parentNode}},replaceWithSpans:function(n){return n.replace(s.regExpGlobal,P)}},B=function(t,n){var r,o,e=w.filterDescendants(y.fromDom(n),w.isMatch);D(e,function(n){var e=w.replaceWithSpans(x.value(n));for(o=t.dom.create("div",null,e);r=o.lastChild;)t.dom.insertAfter(r,n.dom());t.dom.remove(n.dom())})},L=function(e,n){var t=e.dom.select(s.selector,n);D(t,function(n){e.dom.remove(n,1)})},G=B,V=L,Y=function(n){var e=n.getBody(),t=n.selection.getBookmark(),r=w.findParentElm(n.selection.getNode(),e);r=r!==undefined?r:e,L(n,r),B(n,r),n.selection.moveToBookmark(t)},F=function(n,e){var t,r=n.getBody(),o=n.selection;e.set(!e.get()),a(n,e.get()),t=o.getBookmark(),!0===e.get()?G(n,r):V(n,r),o.moveToBookmark(t)},j=function(n,e){n.addCommand("mceVisualChars",function(){F(n,e)})},q=tinymce.util.Tools.resolve("tinymce.util.Delay"),H=function(e,t){var r=q.debounce(function(){Y(e)},300);!1!==e.settings.forced_root_block&&e.on("keydown",function(n){!0===t.get()&&(13===n.keyCode?Y(e):r())})},X=function(t){return function(n){var e=n.control;t.on("VisualChars",function(n){e.active(n.state)})}};i.add("visualchars",function(n){var e,t=u(!1);return j(n,t),(e=n).addButton("visualchars",{active:!1,title:"Show invisible characters",cmd:"mceVisualChars",onPostRender:X(e)}),e.addMenuItem("visualchars",{text:"Show invisible characters",cmd:"mceVisualChars",onPostRender:X(e),selectable:!0,context:"view",prependToContext:!0}),H(n,t),c(t)})}();