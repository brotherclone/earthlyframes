/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.9.2 (2021-09-08)
 */
!function(){"use strict";function o(e){return function(){return e}}function e(e){return e}function i(e){return n=typeof(t=e),"string"==(null===t?"null":"object"==n&&(Array.prototype.isPrototypeOf(t)||t.constructor&&"Array"===t.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(t)||t.constructor&&"String"===t.constructor.name)?"string":n);var t,n}var t,n=tinymce.util.Tools.resolve("tinymce.PluginManager"),u=function(e){return typeof e===t};function s(e){return e.getParam("template_mdate_classes","mdate")}function l(e){return e.getParam("template_replace_values")}function m(e){return e.getParam("template_mdate_format",e.translate("%Y-%m-%d"))}function f(e,t){if((e=""+e).length<t)for(var n=0;n<t-e.length;n++)e="0"+e;return e}function p(e,t,n){void 0===n&&(n=new Date);var r="Sun Mon Tue Wed Thu Fri Sat Sun".split(" "),a="Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split(" "),o="Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" "),c="January February March April May June July August September October November December".split(" ");return(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=t.replace("%D","%m/%d/%Y")).replace("%r","%I:%M:%S %p")).replace("%Y",""+n.getFullYear())).replace("%y",""+n.getYear())).replace("%m",f(n.getMonth()+1,2))).replace("%d",f(n.getDate(),2))).replace("%H",""+f(n.getHours(),2))).replace("%M",""+f(n.getMinutes(),2))).replace("%S",""+f(n.getSeconds(),2))).replace("%I",""+((n.getHours()+11)%12+1))).replace("%p",n.getHours()<12?"AM":"PM")).replace("%B",""+e.translate(c[n.getMonth()]))).replace("%b",""+e.translate(o[n.getMonth()]))).replace("%A",""+e.translate(a[n.getDay()]))).replace("%a",""+e.translate(r[n.getDay()]))).replace("%%","%")}function x(n,e){return O.each(e,function(e,t){u(e)&&(e=e(t)),n=n.replace(new RegExp("\\{\\$"+t+"\\}","g"),e)}),n}function d(e,t){var r=e.dom,a=l(e);O.each(r.select("*",t),function(n){O.each(a,function(e,t){r.hasClass(n,t)&&u(e)&&e(n)})})}function g(e,t){return new RegExp("\\b"+t+"\\b","g").test(e.className)}function y(t,e,n){var r=t.dom,a=t.selection.getContent();n=x(n,l(t));var o=r.create("div",null,n),c=r.select(".mceTmpl",o);c&&0<c.length&&(o=r.create("div",null)).appendChild(c[0].cloneNode(!0)),O.each(r.select("*",o),function(e){g(e,t.getParam("template_cdate_classes","cdate").replace(/\s+/g,"|"))&&(e.innerHTML=p(t,t.getParam("template_cdate_format",t.translate("%Y-%m-%d")))),g(e,s(t).replace(/\s+/g,"|"))&&(e.innerHTML=p(t,m(t))),g(e,t.getParam("template_selected_content_classes","selcontent").replace(/\s+/g,"|"))&&(e.innerHTML=a)}),d(t,o),t.execCommand("mceInsertContent",!1,o.innerHTML),t.addVisual()}function r(){return b}var c=o(!(t="function")),v=o(!0),O=tinymce.util.Tools.resolve("tinymce.util.Tools"),h=tinymce.util.Tools.resolve("tinymce.util.XHR"),b={fold:function(e,t){return e()},isSome:c,isNone:v,getOr:e,getOrThunk:a,getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:o(null),getOrUndefined:o(void 0),or:e,orThunk:a,map:r,each:function(){},bind:r,exists:c,forall:v,filter:function(){return b},toArray:function(){return[]},toString:o("none()")};function a(e){return e()}function T(M,t){function l(e,t){return function(e,t,n){for(var r=0,a=e.length;r<a;r++){var o=e[r];if(t(o,r))return P.some(o);if(n(o,r))break}return P.none()}(e,function(e){return e.text===t},c)}function i(e){M.windowManager.alert("Could not load the specified template.",function(){return e.focus("template")})}function u(e){return new _(function(t,n){e.value.url.fold(function(){return t(e.value.content.getOr(""))},function(e){return h.send({url:e,success:function(e){t(e)},error:function(e){n(e)}})})})}!function(){if(t&&0!==t.length)return P.from(O.map(t,function(e,t){function n(e){return void 0!==e.url}return{selected:0===t,text:e.title,value:{url:n(e)?P.from(e.url):P.none(),content:n(e)?P.none():P.from(e.content),description:e.description}}}));var e=M.translate("No templates defined.");return M.notificationManager.open({text:e,type:"info"}),P.none()}().each(function(o){function b(e,t){return{title:"Insert Template",size:"large",body:{type:"panel",items:e},initialData:t,buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],onSubmit:function(t){var e=t.getData();l(n,e.template).each(function(e){u(e).then(function(e){M.execCommand("mceInsertTemplate",!1,e),t.close()}).catch(function(){t.disable("save"),i(t)})})},onChange:(r=n=o,a=c,function(n,e){var t;"template"===e.name&&(t=n.getData().template,l(r,t).each(function(t){n.block("Loading..."),u(t).then(function(e){a(n,t,e)}).catch(function(){a(n,t,""),n.disable("save"),i(n)})}))})};var r,a,n}var T=function(e){for(var t=e.length,n=new Array(t),r=0;r<t;r++){var a=e[r];n[r]={text:a.text,value:a.text}}return n}(o),c=function(e,t,n){var r,a,o,c,l,i,u,s,m,f,p,d,g,y=(r=M,-1===(a=n).indexOf("<html>")&&(o="",c=r.getParam("content_style","","string"),l=r.getParam("content_css_cors",!1,"boolean")?' crossorigin="anonymous"':"",O.each(r.contentCSS,function(e){o+='<link type="text/css" rel="stylesheet" href="'+r.documentBaseURI.toAbsolute(e)+'"'+l+">"}),c&&(o+='<style type="text/css">'+c+"</style>"),i=-1===(g=(p=r).getParam("body_class","","string")).indexOf("=")?g:(d=p).getParam("body_class","","hash")[d.id]||"",u=r.dom.encode,s='<script>document.addEventListener && document.addEventListener("click", function(e) {for (var elm = e.target; elm; elm = elm.parentNode) {if (elm.nodeName === "A" && !('+(S.mac?"e.metaKey":"e.ctrlKey && !e.altKey")+")) {e.preventDefault();}}}, false);<\/script> ",f=(m=r.getBody().dir)?' dir="'+u(m)+'"':"",a='<!DOCTYPE html><html><head><base href="'+u(r.documentBaseURI.getURI())+'">'+o+s+'</head><body class="'+u(i)+'"'+f+">"+a+"</body></html>"),x(a,r.getParam("template_preview_replace_values"))),v=[{type:"selectbox",name:"template",label:"Templates",items:T},{type:"htmlpanel",html:'<p aria-live="polite">'+t.value.description.replace(/["'<>&]/g,function(e){return(C(t=A,n=e)?P.from(t[n]):P.none()).getOr(e);var t,n})+"</p>"},{label:"Preview",type:"iframe",name:"preview",sandboxed:!1}],h={template:t.text,preview:y};e.unblock(),e.redial(b(v,h)),e.focus("template")},t=M.windowManager.open(b([],{template:"",preview:""}));t.block("Loading..."),u(o[0]).then(function(e){c(t,o[0],e)}).catch(function(){c(t,o[0],""),t.disable("save"),i(t)})})}var M=function(n){function e(){return a}function t(e){return e(n)}var r=o(n),a={fold:function(e,t){return t(n)},isSome:v,isNone:c,getOr:r,getOrThunk:r,getOrDie:r,getOrNull:r,getOrUndefined:r,or:e,orThunk:e,map:function(e){return M(e(n))},each:function(e){e(n)},bind:t,exists:t,forall:t,filter:function(e){return e(n)?a:b},toArray:function(){return[n]},toString:function(){return"some("+n+")"}};return a},P={some:M,none:r,from:function(e){return null==e?b:M(e)}},S=tinymce.util.Tools.resolve("tinymce.Env"),_=tinymce.util.Tools.resolve("tinymce.util.Promise"),w=Object.hasOwnProperty,C=function(e,t){return w.call(e,t)},A={'"':"&quot;","<":"&lt;",">":"&gt;","&":"&amp;","'":"&#039;"};n.add("template",function(e){function t(){return n.execCommand("mceTemplate")}var n,r,a,o,c,l;(n=e).ui.registry.addButton("template",{icon:"template",tooltip:"Insert template",onAction:t}),n.ui.registry.addMenuItem("template",{icon:"template",text:"Insert template...",onAction:t}),(a=e).addCommand("mceInsertTemplate",function(r){for(var a=[],e=1;e<arguments.length;e++)a[e-1]=arguments[e];return function(){for(var e=[],t=0;t<arguments.length;t++)e[t]=arguments[t];var n=a.concat(e);return r.apply(null,n)}}(y,a)),a.addCommand("mceTemplate",(l=o=a,c=function(e){T(l,e)},function(){var e=o.getParam("templates");u(e)?e(c):i(e)?h.send({url:e,success:function(e){c(JSON.parse(e))}}):c(e)})),(r=e).on("PreProcess",function(e){var t=r.dom,n=m(r);O.each(t.select("div",e.node),function(e){t.hasClass(e,"mceTmpl")&&(O.each(t.select("*",e),function(e){t.hasClass(e,s(r).replace(/\s+/g,"|"))&&(e.innerHTML=p(r,n))}),d(r,e))})})})}();
