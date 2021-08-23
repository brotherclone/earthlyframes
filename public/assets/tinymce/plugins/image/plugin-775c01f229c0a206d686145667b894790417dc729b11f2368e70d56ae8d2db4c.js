!function(){"use strict";function m(o){var t=function(e,r,a,t){var i=new XMLHttpRequest;i.open("POST",o.url),i.withCredentials=o.credentials,i.upload.onprogress=function(e){t(e.loaded/e.total*100)},i.onerror=function(){a("Image upload failed due to a XHR Transport error. Code: "+i.status)},i.onload=function(){var e,t,n;i.status<200||300<=i.status?a("HTTP Error: "+i.status):(e=JSON.parse(i.responseText))&&"string"==typeof e.location?r((t=o.basePath,n=e.location,t?t.replace(/\/$/,"")+"/"+n.replace(/^\//,""):n)):a("Invalid JSON: "+i.responseText)};var n=new FormData;n.append("file",e.blob(),e.filename()),i.send(n)};return o=ve.extend({credentials:!1,handler:t},o),{upload:function(e){return o.url||o.handler!==t?(n=e,r=o.handler,new N(function(e,t){try{r(n,e,t,p)}catch(a){t(a.message)}})):N.reject("Upload url missing from the settings.");var n,r}}}var t,e,a,n,o,r=tinymce.util.Tools.resolve("tinymce.PluginManager"),c=function(){return(c=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var a in t=arguments[n])Object.prototype.hasOwnProperty.call(t,a)&&(e[a]=t[a]);return e}).apply(this,arguments)},i=function(r){return function(e){return n=typeof(t=e),(null===t?"null":"object"==n&&(Array.prototype.isPrototypeOf(t)||t.constructor&&"Array"===t.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(t)||t.constructor&&"String"===t.constructor.name)?"string":n)===r;var t,n}},l=function(t){return function(e){return typeof e===t}},A=i("string"),s=i("object"),u=i("array"),d=function(e){return t===e},g=l("boolean"),f=l("number"),p=function(){},h=function(e){return function(){return e}},b=h(!1),v=h(!(t=null)),y=function(){return D},D=(e=function(e){return e.isNone()},{fold:function(e){return e()},is:b,isSome:b,isNone:v,getOr:n=function(e){return e},getOrThunk:a=function(e){return e()},getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:h(null),getOrUndefined:h(undefined),or:n,orThunk:a,map:y,each:p,bind:y,exists:b,forall:v,filter:y,equals:e,equals_:e,toArray:function(){return[]},toString:h("none()")}),w=function(n){var e=h(n),t=function(){return a},r=function(e){return e(n)},a={fold:function(e,t){return t(n)},is:function(e){return n===e},isSome:v,isNone:b,getOr:e,getOrThunk:e,getOrDie:e,getOrNull:e,getOrUndefined:e,or:t,orThunk:t,map:function(e){return w(e(n))},each:function(e){e(n)},bind:r,exists:r,forall:r,filter:function(e){return e(n)?a:D},toArray:function(){return[n]},toString:function(){return"some("+n+")"},equals:function(e){return e.is(n)},equals_:function(e,t){return e.fold(b,function(e){return t(n,e)})}};return a},S={some:w,none:y,from:function(e){return null===e||e===undefined?D:w(e)}},x=Array.prototype.push,T=function(e){for(var t=[],n=0,r=e.length;n<r;++n){if(!u(e[n]))throw new Error("Arr.flatten item "+n+" was not an array, input: "+e);x.apply(t,e[n])}return t},C=("undefined"!=typeof window||Function("return this;")(),function(e,t,n){!function(e,t,n){if(!(A(n)||g(n)||f(n)))throw console.error("Invalid call to Attribute.set. Key ",t,":: Value ",n,":: Element ",e),new Error("Attribute value was not simple");e.setAttribute(t,n+"")}(e.dom,t,n)}),U=function(e){if(null===e||e===undefined)throw new Error("Node cannot be null or undefined");return{dom:e}},O={fromHtml:function(e,t){var n=(t||document).createElement("div");if(n.innerHTML=e,!n.hasChildNodes()||1<n.childNodes.length)throw console.error("HTML does not have a single root node",e),new Error("HTML must have a single root node");return U(n.childNodes[0])},fromTag:function(e,t){var n=(t||document).createElement(e);return U(n)},fromText:function(e,t){var n=(t||document).createTextNode(e);return U(n)},fromDom:U,fromPoint:function(e,t,n){return S.from(e.dom.elementFromPoint(t,n)).map(U)}},I=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),N=tinymce.util.Tools.resolve("tinymce.util.Promise"),P=tinymce.util.Tools.resolve("tinymce.util.XHR"),_=function(e){return e.getParam("image_dimensions",!0,"boolean")},L=function(e){return e.getParam("images_upload_url","","string")},E=function(e){return e.getParam("images_upload_handler",undefined,"function")},M=function(e,t){return Math.max(parseInt(e,10),parseInt(t,10))},R=function(e){return e&&e.replace(/px$/,"")},z=function(e){return 0<e.length&&/^[0-9]+$/.test(e)&&(e+="px"),e},H=function(e){if(e.margin){var t=String(e.margin).split(" ");switch(t.length){case 1:e["margin-top"]=e["margin-top"]||t[0],e["margin-right"]=e["margin-right"]||t[0],e["margin-bottom"]=e["margin-bottom"]||t[0],e["margin-left"]=e["margin-left"]||t[0];break;case 2:e["margin-top"]=e["margin-top"]||t[0],e["margin-right"]=e["margin-right"]||t[1],e["margin-bottom"]=e["margin-bottom"]||t[0],e["margin-left"]=e["margin-left"]||t[1];break;case 3:e["margin-top"]=e["margin-top"]||t[0],e["margin-right"]=e["margin-right"]||t[1],e["margin-bottom"]=e["margin-bottom"]||t[2],e["margin-left"]=e["margin-left"]||t[1];break;case 4:e["margin-top"]=e["margin-top"]||t[0],e["margin-right"]=e["margin-right"]||t[1],e["margin-bottom"]=e["margin-bottom"]||t[2],e["margin-left"]=e["margin-left"]||t[3]}delete e.margin}return e},k=function(e){return"IMG"===e.nodeName&&(e.hasAttribute("data-mce-object")||e.hasAttribute("data-mce-placeholder"))},j=I.DOM,B=function(e){return e.style.marginLeft&&e.style.marginRight&&e.style.marginLeft===e.style.marginRight?R(e.style.marginLeft):""},F=function(e){return e.style.marginTop&&e.style.marginBottom&&e.style.marginTop===e.style.marginBottom?R(e.style.marginTop):""},G=function(e){return e.style.borderWidth?R(e.style.borderWidth):""},W=function(e,t){return e.hasAttribute(t)?e.getAttribute(t):""},q=function(e,t){return e.style[t]?e.style[t]:""},$=function(e){return null!==e.parentNode&&"FIGURE"===e.parentNode.nodeName},J=function(e,t,n){""===n?e.removeAttribute(t):e.setAttribute(t,n)},X=function(e){var t,n,r,a;$(e)?(a=(r=e).parentNode,j.insertAfter(r,a),j.remove(a)):(t=e,n=j.create("figure",{"class":"image"}),j.insertAfter(n,t),n.appendChild(t),n.appendChild(j.create("figcaption",{contentEditable:"true"},"Caption")),n.contentEditable="false")},V=function(e,t){var n=e.getAttribute("style"),r=t(null!==n?n:"");0<r.length?(e.setAttribute("style",r),e.setAttribute("data-mce-style",r)):e.removeAttribute("style")},K=function(e,r){return function(e,t,n){e.style[t]?(e.style[t]=z(n),V(e,r)):J(e,t,n)}},Z=function(e,t){return e.style[t]?R(e.style[t]):W(e,t)},Q=function(e,t){var n=z(t);e.style.marginLeft=n,e.style.marginRight=n},Y=function(e,t){var n=z(t);e.style.marginTop=n,e.style.marginBottom=n},ee=function(e,t){var n=z(t);e.style.borderWidth=n},te=function(e,t){e.style.borderStyle=t},ne=function(e){return"FIGURE"===e.nodeName},re=function(e){return 0===j.getAttrib(e,"alt").length&&"presentation"===j.getAttrib(e,"role")},ae=function(){return{src:"",alt:"",title:"",width:"",height:"","class":"",style:"",caption:!1,hspace:"",vspace:"",border:"",borderStyle:"",isDecorative:!1}},ie=function(e,t){var n=document.createElement("img");return J(n,"style",t.style),!B(n)&&""===t.hspace||Q(n,t.hspace),!F(n)&&""===t.vspace||Y(n,t.vspace),!G(n)&&""===t.border||ee(n,t.border),!q(n,"borderStyle")&&""===t.borderStyle||te(n,t.borderStyle),e(n.getAttribute("style"))},oe=function(e,t){return{src:W(t,"src"),alt:re(n=t)?"":W(n,"alt"),title:W(t,"title"),width:Z(t,"width"),height:Z(t,"height"),"class":W(t,"class"),style:e(W(t,"style")),caption:$(t),hspace:B(t),vspace:F(t),border:G(t),borderStyle:q(t,"borderStyle"),isDecorative:re(t)};var n},le=function(e,t,n,r,a){n[r]!==t[r]&&a(e,r,n[r])},se=function(e,t,n){var r,a;n?(j.setAttrib(e,"role","presentation"),r=O.fromDom(e),C(r,"alt","")):(d(t)?(a="alt",(r=O.fromDom(e)).dom.removeAttribute(a)):(r=O.fromDom(e),C(r,"alt",t)),"presentation"===j.getAttrib(e,"role")&&j.setAttrib(e,"role",""))},ue=function(r,a){return function(e,t,n){r(e,n),V(e,a)}},ce=function(e,t,n){var r,a,i,o=oe(e,n);le(n,o,t,"caption",function(e){return X(e),0}),le(n,o,t,"src",J),le(n,o,t,"title",J),le(n,o,t,"width",K(0,e)),le(n,o,t,"height",K(0,e)),le(n,o,t,"class",J),le(n,o,t,"style",ue(function(e,t){return J(e,"style",t),0},e)),le(n,o,t,"hspace",ue(Q,e)),le(n,o,t,"vspace",ue(Y,e)),le(n,o,t,"border",ue(ee,e)),le(n,o,t,"borderStyle",ue(te,e)),r=n,a=o,(i=t).alt===a.alt&&i.isDecorative===a.isDecorative||se(r,i.alt,i.isDecorative)},me=function(e,t){var n=e.dom.styles.parse(t),r=H(n),a=e.dom.styles.parse(e.dom.styles.serialize(r));return e.dom.styles.serialize(a)},de=function(e){var t=e.selection.getNode(),n=e.dom.getParent(t,"figure.image");return n?e.dom.select("img",n)[0]:t&&("IMG"!==t.nodeName||k(t))?null:t},ge=function(t,e){var n=t.dom,r=n.getParent(e.parentNode,function(e){return!!t.schema.getTextBlockElements()[e.nodeName]},t.getBody());return r?n.split(r,e):e},fe=function(t,e){var n=function(e,t){var n=document.createElement("img");if(ce(e,c(c({},t),{caption:!1}),n),se(n,t.alt,t.isDecorative),t.caption){var r=j.create("figure",{"class":"image"});return r.appendChild(n),r.appendChild(j.create("figcaption",{contentEditable:"true"},"Caption")),r.contentEditable="false",r}return n}(function(e){return me(t,e)},e);t.dom.setAttrib(n,"data-mce-id","__mcenew"),t.focus(),t.selection.setContent(n.outerHTML);var r,a=t.dom.select('*[data-mce-id="__mcenew"]')[0];t.dom.setAttrib(a,"data-mce-id",null),ne(a)?(r=ge(t,a),t.selection.select(r)):t.selection.select(a)},pe=function(t,e){var n,r,a,i,o,l,s=de(t);ce(function(e){return me(t,e)},e,s),n=s,t.dom.setAttrib(n,"src",n.getAttribute("src")),ne(s.parentNode)?(r=s.parentNode,ge(t,r),t.selection.select(s.parentNode)):(t.selection.select(s),a=t,i=e,l=function(){o.onload=o.onerror=null,a.selection&&(a.selection.select(o),a.nodeChanged())},(o=s).onload=function(){i.width||i.height||!_(a)||a.dom.setAttribs(o,{width:String(o.clientWidth),height:String(o.clientHeight)}),l()},o.onerror=l)},he=Object.prototype.hasOwnProperty,be=(o=function(e,t){return s(e)&&s(t)?be(e,t):t},function(){for(var e=new Array(arguments.length),t=0;t<e.length;t++)e[t]=arguments[t];if(0===e.length)throw new Error("Can't merge zero objects");for(var n={},r=0;r<e.length;r++){var a=e[r];for(var i in a)he.call(a,i)&&(n[i]=o(n[i],a[i]))}return n}),ve=tinymce.util.Tools.resolve("tinymce.util.Tools"),ye=function(e){return A(e.value)?e.value:""},De=function(e,a){var i=[];return ve.each(e,function(e){var t,n,r=A(e.text)?e.text:A(e.title)?e.title:"";e.menu!==undefined?(t=De(e.menu,a),i.push({text:r,items:t})):(n=a(e),i.push({text:r,value:n}))}),i},we=function(t){return void 0===t&&(t=ye),function(e){return e?S.from(e).map(function(e){return De(e,t)}):S.none()}},Ae=function(e,n){return function(e,t){for(var n=0;n<e.length;n++){var r=t(e[n],n);if(r.isSome())return r}return S.none()}(e,function(e){return t=e,Object.prototype.hasOwnProperty.call(t,"items")?Ae(e.items,n):e.value===n?S.some(e):S.none();var t})},Se=we,xe=function(e){return we(ye)(e)},Te=function(e,t){return e.bind(function(e){return Ae(e,t)})},Ce=function(){return{title:"Advanced",name:"advanced",items:[{type:"input",label:"Style",name:"style"},{type:"grid",columns:2,items:[{type:"input",label:"Vertical space",name:"vspace",inputMode:"numeric"},{type:"input",label:"Horizontal space",name:"hspace",inputMode:"numeric"},{type:"input",label:"Border width",name:"border",inputMode:"numeric"},{type:"listbox",name:"borderstyle",label:"Border style",items:[{text:"Select...",value:""},{text:"Solid",value:"solid"},{text:"Dotted",value:"dotted"},{text:"Dashed",value:"dashed"},{text:"Double",value:"double"},{text:"Groove",value:"groove"},{text:"Ridge",value:"ridge"},{text:"Inset",value:"inset"},{text:"Outset",value:"outset"},{text:"None",value:"none"},{text:"Hidden",value:"hidden"}]}]}]}},Ue=function(r){var t,e,a=Se(function(e){return r.convertURL(e.value||e.url,"src")}),n=new N(function(t){var n,e;n=function(e){t(a(e).map(function(e){return T([[{text:"None",value:""}],e])}))},"string"==typeof(e=r.getParam("image_list",!1))?P.send({url:e,success:function(e){n(JSON.parse(e))}}):"function"==typeof e?e(n):n(e)}),i=xe(r.getParam("image_class_list")),o=r.getParam("image_advtab",!1,"boolean"),l=r.getParam("image_uploadtab",!0,"boolean"),s=!!L(r),u=!!E(r),c=(e=de(t=r))?oe(function(e){return me(t,e)},e):ae(),m=r.getParam("image_description",!0,"boolean"),d=r.getParam("image_title",!1,"boolean"),g=_(r),f=r.getParam("image_caption",!1,"boolean"),p=r.getParam("a11y_advanced_options",!1,"boolean"),h=L(r),b=r.getParam("images_upload_base_path",undefined,"string"),v=r.getParam("images_upload_credentials",!1,"boolean"),y=E(r),D=r.getParam("automatic_uploads",!0,"boolean"),w=S.some(r.getParam("image_prepend_url","","string")).filter(function(e){return A(e)&&0<e.length});return n.then(function(e){return{image:c,imageList:e,classList:i,hasAdvTab:o,hasUploadTab:l,hasUploadUrl:s,hasUploadHandler:u,hasDescription:m,hasImageTitle:d,hasDimensions:g,hasImageCaption:f,url:h,basePath:b,credentials:v,handler:y,prependURL:w,hasAccessibilityOptions:p,automaticUploads:D}})},Oe=function(e){var t=e.imageList.map(function(e){return{name:"images",type:"listbox",label:"Image list",items:e}}),n={name:"alt",type:"input",label:"Alternative description",disabled:e.hasAccessibilityOptions&&e.image.isDecorative},r=e.classList.map(function(e){return{name:"classes",type:"listbox",label:"Class",items:e}});return T([[{name:"src",type:"urlinput",filetype:"image",label:"Source"}],t.toArray(),e.hasAccessibilityOptions&&e.hasDescription?[{type:"label",label:"Accessibility",items:[{name:"isDecorative",type:"checkbox",label:"Image is decorative"}]}]:[],e.hasDescription?[n]:[],e.hasImageTitle?[{name:"title",type:"input",label:"Image title"}]:[],e.hasDimensions?[{name:"dimensions",type:"sizeinput"}]:[],[{type:"grid",columns:2,items:T([r.toArray(),e.hasImageCaption?[{type:"label",label:"Caption",items:[{type:"checkbox",name:"caption",label:"Show caption"}]}]:[]])}]])},Ie=function(e){return{title:"General",name:"general",items:Oe(e)}},Ne=Oe,Pe=function(){return{title:"Upload",name:"upload",items:[{type:"dropzone",name:"fileinput"}]}},_e=function(e){return{src:{value:e.src,meta:{}},images:e.src,alt:e.alt,title:e.title,dimensions:{width:e.width,height:e.height},classes:e["class"],caption:e.caption,style:e.style,vspace:e.vspace,border:e.border,hspace:e.hspace,borderstyle:e.borderStyle,fileinput:[],isDecorative:e.isDecorative}},Le=function(e,t){return{src:e.src.value,alt:0===e.alt.length&&t?null:e.alt,title:e.title,width:e.dimensions.width,height:e.dimensions.height,"class":e.classes,style:e.style,caption:e.caption,hspace:e.hspace,vspace:e.vspace,border:e.border,borderStyle:e.borderstyle,isDecorative:e.isDecorative}},Ee=function(e,t){var n,r,a=t.getData();n=e,r=a.src.value,(/^(?:[a-zA-Z]+:)?\/\//.test(r)?S.none():n.prependURL.bind(function(e){return r.substring(0,e.length)!==e?S.some(e+r):S.none()})).each(function(e){t.setData({src:{value:e,meta:a.src.meta}})})},Me=function(e,t){var n,r,a,i,o=t.getData(),l=o.src.meta;l!==undefined&&(n=be({},o),a=n,i=l,(r=e).hasDescription&&A(i.alt)&&(a.alt=i.alt),r.hasAccessibilityOptions&&(a.isDecorative=i.isDecorative||a.isDecorative||!1),r.hasImageTitle&&A(i.title)&&(a.title=i.title),r.hasDimensions&&(A(i.width)&&(a.dimensions.width=i.width),A(i.height)&&(a.dimensions.height=i.height)),A(i["class"])&&Te(r.classList,i["class"]).each(function(e){a.classes=e.value}),r.hasImageCaption&&g(i.caption)&&(a.caption=i.caption),r.hasAdvTab&&(A(i.style)&&(a.style=i.style),A(i.vspace)&&(a.vspace=i.vspace),A(i.border)&&(a.border=i.border),A(i.hspace)&&(a.hspace=i.hspace),A(i.borderstyle)&&(a.borderstyle=i.borderstyle)),t.setData(n))},Re=function(e,t,n,r){var a,i,o,l,s,u,c,m,d,g,f,p;Ee(t,r),Me(t,r),a=e,i=t,o=n,u=(s=(l=r).getData()).src.value,(c=s.src.meta||{}).width||c.height||!i.hasDimensions||a.imageSize(u).then(function(e){o.open&&l.setData({dimensions:e})}),m=t,d=n,f=(g=r).getData(),p=Te(m.imageList,f.src.value),d.prevImage=p,g.setData({images:p.map(function(e){return e.value}).getOr("")})},ze=function(e,t,n){var r,a,i,o,l,s=H(e(n.style)),u=be({},n);return u.vspace=(r=s)["margin-top"]&&r["margin-bottom"]&&r["margin-top"]===r["margin-bottom"]?R(String(r["margin-top"])):"",u.hspace=(a=s)["margin-right"]&&a["margin-left"]&&a["margin-right"]===a["margin-left"]?R(String(a["margin-right"])):"",u.border=(i=s)["border-width"]?R(String(i["border-width"])):"",u.borderstyle=(o=s)["border-style"]?String(o["border-style"]):"",u.style=(l=t)(e(l(s))),u},He=function(s,u,t,c){var e,n=c.getData();c.block("Uploading image"),(0===(e=n.fileinput).length?S.none():S.some(e[0])).fold(function(){c.unblock()},function(n){var r,a=URL.createObjectURL(n),i=m({url:u.url,basePath:u.basePath,credentials:u.credentials,handler:u.handler}),o=function(){c.unblock(),URL.revokeObjectURL(a)},l=function(e){c.setData({src:{value:e,meta:{}}}),c.showTab("general"),Re(s,u,t,c)};r=n,new N(function(e,t){var n=new FileReader;n.onload=function(){e(n.result)},n.onerror=function(){t(n.error.message)},n.readAsDataURL(r)}).then(function(e){var t=s.createBlobCache(n,a,e);u.automaticUploads?i.upload(t).then(function(e){l(e),o()})["catch"](function(e){o(),s.alertErr(e)}):(s.addToBlobCache(t),l(t.blobUri()),c.unblock())})})},ke=function(h,b,v){return function(e,t){var n,r,a,i,o,l,s,u,c,m,d,g,f,p;"src"===t.name?Re(h,b,v,e):"images"===t.name?(c=h,m=b,d=v,f=(g=e).getData(),(p=Te(m.imageList,f.images)).each(function(e){""===f.alt||d.prevImage.map(function(e){return e.text===f.alt}).getOr(!1)?""===e.value?g.setData({src:e,alt:d.prevAlt}):g.setData({src:e,alt:e.text}):g.setData({src:e})}),d.prevImage=p,Re(c,m,d,g)):"alt"===t.name?v.prevAlt=e.getData().alt:"style"===t.name?(o=h,s=(l=e).getData(),u=ze(o.parseStyle,o.serializeStyle,s),l.setData(u)):"vspace"===t.name||"hspace"===t.name||"border"===t.name||"borderstyle"===t.name?(n=h,r=e,a=be(_e(b.image),r.getData()),i=ie(n.normalizeCss,Le(a,!1)),r.setData({style:i})):"fileinput"===t.name?He(h,b,v,e):"isDecorative"===t.name&&(e.getData().isDecorative?e.disable("alt"):e.enable("alt"))}},je=function(i){return function(e){var t,n,r,a={prevImage:Te((t=e).imageList,t.image.src),prevAlt:t.image.alt,open:!0};return{title:"Insert/Edit Image",size:"normal",body:(r=e).hasAdvTab||r.hasUploadUrl||r.hasUploadHandler?{type:"tabpanel",tabs:T([[Ie(r)],r.hasAdvTab?[Ce(r)]:[],r.hasUploadTab&&(r.hasUploadUrl||r.hasUploadHandler)?[Pe(r)]:[]])}:{type:"panel",items:Ne(r)},buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],initialData:_e(e.image),onSubmit:i.onSubmit(e),onChange:ke(i,e,a),onClose:(n=a,function(){n.open=!1})}}},Be=function(t){return function(e){return a=t.documentBaseURI.toAbsolute(e),new N(function(t){var n=document.createElement("img"),r=function(e){n.parentNode&&n.parentNode.removeChild(n),t(e)};n.onload=function(){var e={width:M(n.width,n.clientWidth),height:M(n.height,n.clientHeight)};r(N.resolve(e))},n.onerror=function(){r(N.reject("Failed to get image dimensions for: "+a))};var e=n.style;e.visibility="hidden",e.position="fixed",e.bottom=e.left="0px",e.width=e.height="auto",document.body.appendChild(n),n.src=a}).then(function(e){return{width:String(e.width),height:String(e.height)}});var a}},Fe=function(e){var n,t,r,a,i,o,l,s={onSubmit:function(n){return function(e){var t=be(_e(n.image),e.getData());l.execCommand("mceUpdateImage",!1,Le(t,n.hasAccessibilityOptions)),l.editorUpload.uploadImagesAuto(),e.close()}},imageSize:Be(l=e),addToBlobCache:function(e){o.editorUpload.blobCache.add(e)},createBlobCache:function(e,t,n){return i.editorUpload.blobCache.create({blob:e,blobUri:t,name:e.name?e.name.replace(/\.[^\.]+$/,""):null,base64:n.split(",")[1]})},alertErr:function(e){a.windowManager.alert(e)},normalizeCss:function(e){return me(r,e)},parseStyle:function(e){return t.dom.parseStyle(e)},serializeStyle:(n=t=r=a=i=o=e,function(e,t){return n.dom.serializeStyle(e,t)})};return{open:function(){Ue(e).then(je(s)).then(e.windowManager.open)}}},Ge=function(u){u.addCommand("mceImage",Fe(u).open),u.addCommand("mceUpdateImage",function(e,s){u.undoManager.transact(function(){return e=s,void((l=de(t=u))?(n=oe(function(e){return me(t,e)},l),(r=c(c({},n),e)).src?pe(t,r):(a=t,(i=l)&&(o=a.dom.is(i.parentNode,"figure.image")?i.parentNode:i,a.dom.remove(o),a.focus(),a.nodeChanged(),a.dom.isEmpty(a.getBody())&&(a.setContent(""),a.selection.setCursorLocation())))):e.src&&fe(t,c(c({},ae()),e)));var t,e,n,r,a,i,o,l})})},We=function(i){return function(e){for(var t,n=e.length,r=function(e){e.attr("contenteditable",i?"true":null)};n--;){var a=e[n];(t=a.attr("class"))&&/\bimage\b/.test(t)&&(a.attr("contenteditable",i?"false":null),ve.each(a.getAll("figcaption"),r))}}};r.add("image",function(e){var t,n;(t=e).on("PreInit",function(){t.parser.addNodeFilter("figure",We(!0)),t.serializer.addNodeFilter("figure",We(!1))}),(n=e).ui.registry.addToggleButton("image",{icon:"image",tooltip:"Insert/edit image",onAction:Fe(n).open,onSetup:function(e){return n.selection.selectorChangedWithUnbind("img:not([data-mce-object],[data-mce-placeholder]),figure.image",e.setActive).unbind}}),n.ui.registry.addMenuItem("image",{icon:"image",text:"Image...",onAction:Fe(n).open}),n.ui.registry.addContextMenu("image",{update:function(e){return ne(e)||"IMG"===e.nodeName&&!k(e)?["image"]:[]}}),Ge(e)})}();