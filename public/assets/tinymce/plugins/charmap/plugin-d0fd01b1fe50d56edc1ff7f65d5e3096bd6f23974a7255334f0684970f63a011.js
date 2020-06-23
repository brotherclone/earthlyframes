!function(l){"use strict";function e(){}function i(e){return function(){return e}}function n(){return k}function r(e){return e.isNone()}function t(e){return e()}function a(e){return e}function o(n){return function(e){return function(e){if(null===e)return"null";var n=typeof e;return"object"==n&&(Array.prototype.isPrototypeOf(e)||e.constructor&&"Array"===e.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(e)||e.constructor&&"String"===e.constructor.name)?"string":n}(e)===n}}function g(e,n){for(var r=e.length,t=new Array(r),a=0;a<r;a++){var i=e[a];t[a]=n(i,a)}return t}function c(e,n){return function(e){for(var n=[],r=0,t=e.length;r<t;++r){if(!O(e[r]))throw new Error("Arr.flatten item "+r+" was not an array, input: "+e);q.apply(n,e[r])}return n}(g(e,n))}function u(e){return S(e)?[].concat((n=e,p.grep(n,function(e){return S(e)&&2===e.length}))):"function"==typeof e?e():[];var n}function s(e,n){return-1!==e.indexOf(n)}var f,m=tinymce.util.Tools.resolve("tinymce.PluginManager"),h=function(e,n){return e.fire("insertCustomChar",{chr:n})},d=function(e,n){var r=h(e,n).chr;e.execCommand("mceInsertContent",!1,r)},p=tinymce.util.Tools.resolve("tinymce.util.Tools"),y=function(e){return e.settings.charmap},w=function(e){return e.settings.charmap_append},b=i(!1),v=i(!0),k=(f={fold:function(e){return e()},is:b,isSome:b,isNone:v,getOr:a,getOrThunk:t,getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:i(null),getOrUndefined:i(undefined),or:a,orThunk:t,map:n,each:e,bind:n,exists:b,forall:v,filter:n,equals:r,equals_:r,toArray:function(){return[]},toString:i("none()")},Object.freeze&&Object.freeze(f),f),C=function(r){function e(){return a}function n(e){return e(r)}var t=i(r),a={fold:function(e,n){return n(r)},is:function(e){return r===e},isSome:v,isNone:b,getOr:t,getOrThunk:t,getOrDie:t,getOrNull:t,getOrUndefined:t,or:e,orThunk:e,map:function(e){return C(e(r))},each:function(e){e(r)},bind:n,exists:n,forall:n,filter:function(e){return e(r)?a:k},toArray:function(){return[r]},toString:function(){return"some("+r+")"},equals:function(e){return e.is(r)},equals_:function(e,n){return e.fold(b,function(e){return n(r,e)})}};return a},A={some:C,none:n,from:function(e){return null===e||e===undefined?k:C(e)}},O=o("array"),x=o("function"),q=(Array.prototype.slice,Array.prototype.push),S=(x(Array.from)&&Array.from,p.isArray),T="User Defined",E=function(e){var n=function(e,n){var r=y(e);r&&(n=[{name:T,characters:u(r)}]);var t=w(e);if(t){var a=p.grep(n,function(e){return e.name===T});return a.length?(a[0].characters=[].concat(a[0].characters).concat(u(t)),n):[].concat(n).concat({name:T,characters:u(t)})}return n}(e,[{name:"Currency",characters:[[36,"dollar sign"],[162,"cent sign"],[8364,"euro sign"],[163,"pound sign"],[165,"yen sign"],[164,"currency sign"],[8352,"euro-currency sign"],[8353,"colon sign"],[8354,"cruzeiro sign"],[8355,"french franc sign"],[8356,"lira sign"],[8357,"mill sign"],[8358,"naira sign"],[8359,"peseta sign"],[8360,"rupee sign"],[8361,"won sign"],[8362,"new sheqel sign"],[8363,"dong sign"],[8365,"kip sign"],[8366,"tugrik sign"],[8367,"drachma sign"],[8368,"german penny symbol"],[8369,"peso sign"],[8370,"guarani sign"],[8371,"austral sign"],[8372,"hryvnia sign"],[8373,"cedi sign"],[8374,"livre tournois sign"],[8375,"spesmilo sign"],[8376,"tenge sign"],[8377,"indian rupee sign"],[8378,"turkish lira sign"],[8379,"nordic mark sign"],[8380,"manat sign"],[8381,"ruble sign"],[20870,"yen character"],[20803,"yuan character"],[22291,"yuan character, in hong kong and taiwan"],[22278,"yen/yuan character variant one"]]},{name:"Text",characters:[[169,"copyright sign"],[174,"registered sign"],[8482,"trade mark sign"],[8240,"per mille sign"],[181,"micro sign"],[183,"middle dot"],[8226,"bullet"],[8230,"three dot leader"],[8242,"minutes / feet"],[8243,"seconds / inches"],[167,"section sign"],[182,"paragraph sign"],[223,"sharp s / ess-zed"]]},{name:"Quotations",characters:[[8249,"single left-pointing angle quotation mark"],[8250,"single right-pointing angle quotation mark"],[171,"left pointing guillemet"],[187,"right pointing guillemet"],[8216,"left single quotation mark"],[8217,"right single quotation mark"],[8220,"left double quotation mark"],[8221,"right double quotation mark"],[8218,"single low-9 quotation mark"],[8222,"double low-9 quotation mark"],[60,"less-than sign"],[62,"greater-than sign"],[8804,"less-than or equal to"],[8805,"greater-than or equal to"],[8211,"en dash"],[8212,"em dash"],[175,"macron"],[8254,"overline"],[164,"currency sign"],[166,"broken bar"],[168,"diaeresis"],[161,"inverted exclamation mark"],[191,"turned question mark"],[710,"circumflex accent"],[732,"small tilde"],[176,"degree sign"],[8722,"minus sign"],[177,"plus-minus sign"],[247,"division sign"],[8260,"fraction slash"],[215,"multiplication sign"],[185,"superscript one"],[178,"superscript two"],[179,"superscript three"],[188,"fraction one quarter"],[189,"fraction one half"],[190,"fraction three quarters"]]},{name:"Mathematical",characters:[[402,"function / florin"],[8747,"integral"],[8721,"n-ary sumation"],[8734,"infinity"],[8730,"square root"],[8764,"similar to"],[8773,"approximately equal to"],[8776,"almost equal to"],[8800,"not equal to"],[8801,"identical to"],[8712,"element of"],[8713,"not an element of"],[8715,"contains as member"],[8719,"n-ary product"],[8743,"logical and"],[8744,"logical or"],[172,"not sign"],[8745,"intersection"],[8746,"union"],[8706,"partial differential"],[8704,"for all"],[8707,"there exists"],[8709,"diameter"],[8711,"backward difference"],[8727,"asterisk operator"],[8733,"proportional to"],[8736,"angle"]]},{name:"Extended Latin",characters:[[192,"A - grave"],[193,"A - acute"],[194,"A - circumflex"],[195,"A - tilde"],[196,"A - diaeresis"],[197,"A - ring above"],[256,"A - macron"],[198,"ligature AE"],[199,"C - cedilla"],[200,"E - grave"],[201,"E - acute"],[202,"E - circumflex"],[203,"E - diaeresis"],[274,"E - macron"],[204,"I - grave"],[205,"I - acute"],[206,"I - circumflex"],[207,"I - diaeresis"],[298,"I - macron"],[208,"ETH"],[209,"N - tilde"],[210,"O - grave"],[211,"O - acute"],[212,"O - circumflex"],[213,"O - tilde"],[214,"O - diaeresis"],[216,"O - slash"],[332,"O - macron"],[338,"ligature OE"],[352,"S - caron"],[217,"U - grave"],[218,"U - acute"],[219,"U - circumflex"],[220,"U - diaeresis"],[362,"U - macron"],[221,"Y - acute"],[376,"Y - diaeresis"],[562,"Y - macron"],[222,"THORN"],[224,"a - grave"],[225,"a - acute"],[226,"a - circumflex"],[227,"a - tilde"],[228,"a - diaeresis"],[229,"a - ring above"],[257,"a - macron"],[230,"ligature ae"],[231,"c - cedilla"],[232,"e - grave"],[233,"e - acute"],[234,"e - circumflex"],[235,"e - diaeresis"],[275,"e - macron"],[236,"i - grave"],[237,"i - acute"],[238,"i - circumflex"],[239,"i - diaeresis"],[299,"i - macron"],[240,"eth"],[241,"n - tilde"],[242,"o - grave"],[243,"o - acute"],[244,"o - circumflex"],[245,"o - tilde"],[246,"o - diaeresis"],[248,"o slash"],[333,"o macron"],[339,"ligature oe"],[353,"s - caron"],[249,"u - grave"],[250,"u - acute"],[251,"u - circumflex"],[252,"u - diaeresis"],[363,"u - macron"],[253,"y - acute"],[254,"thorn"],[255,"y - diaeresis"],[563,"y - macron"],[913,"Alpha"],[914,"Beta"],[915,"Gamma"],[916,"Delta"],[917,"Epsilon"],[918,"Zeta"],[919,"Eta"],[920,"Theta"],[921,"Iota"],[922,"Kappa"],[923,"Lambda"],[924,"Mu"],[925,"Nu"],[926,"Xi"],[927,"Omicron"],[928,"Pi"],[929,"Rho"],[931,"Sigma"],[932,"Tau"],[933,"Upsilon"],[934,"Phi"],[935,"Chi"],[936,"Psi"],[937,"Omega"],[945,"alpha"],[946,"beta"],[947,"gamma"],[948,"delta"],[949,"epsilon"],[950,"zeta"],[951,"eta"],[952,"theta"],[953,"iota"],[954,"kappa"],[955,"lambda"],[956,"mu"],[957,"nu"],[958,"xi"],[959,"omicron"],[960,"pi"],[961,"rho"],[962,"final sigma"],[963,"sigma"],[964,"tau"],[965,"upsilon"],[966,"phi"],[967,"chi"],[968,"psi"],[969,"omega"]]},{name:"Symbols",characters:[[8501,"alef symbol"],[982,"pi symbol"],[8476,"real part symbol"],[978,"upsilon - hook symbol"],[8472,"Weierstrass p"],[8465,"imaginary part"]]},{name:"Arrows",characters:[[8592,"leftwards arrow"],[8593,"upwards arrow"],[8594,"rightwards arrow"],[8595,"downwards arrow"],[8596,"left right arrow"],[8629,"carriage return"],[8656,"leftwards double arrow"],[8657,"upwards double arrow"],[8658,"rightwards double arrow"],[8659,"downwards double arrow"],[8660,"left right double arrow"],[8756,"therefore"],[8834,"subset of"],[8835,"superset of"],[8836,"not a subset of"],[8838,"subset of or equal to"],[8839,"superset of or equal to"],[8853,"circled plus"],[8855,"circled times"],[8869,"perpendicular"],[8901,"dot operator"],[8968,"left ceiling"],[8969,"right ceiling"],[8970,"left floor"],[8971,"right floor"],[9001,"left-pointing angle bracket"],[9002,"right-pointing angle bracket"],[9674,"lozenge"],[9824,"black spade suit"],[9827,"black club suit"],[9829,"black heart suit"],[9830,"black diamond suit"],[8194,"en space"],[8195,"em space"],[8201,"thin space"],[8204,"zero width non-joiner"],[8205,"zero width joiner"],[8206,"left-to-right mark"],[8207,"right-to-left mark"]]}]);return 1<n.length?[{name:"All",characters:c(n,function(e){return e.characters})}].concat(n):n},z=function(n){return{getCharMap:function(){return E(n)},insertChar:function(e){d(n,e)}}},N=function(e){function n(){return r}var r=e;return{get:n,set:function(e){r=e},clone:function(){return N(n())}}},U=function(e,n){var a=[],i=n.toLowerCase();return function(e,n){for(var r=0,t=e.length;r<t;r++)n(e[r],r)}(e.characters,function(e){var n,r,t;n=e[0],r=e[1],t=i,!(s(String.fromCharCode(n).toLowerCase(),t)||s(r.toLowerCase(),t)||s(r.toLowerCase().replace(/\s+/g,""),t))||a.push(e)}),g(a,function(e){return{text:e[1],value:String.fromCharCode(e[0]),icon:String.fromCharCode(e[0])}})},D="pattern",I=function(r,e){function n(){return[{label:"Search",type:"input",name:D},{type:"collection",name:"results"}]}function t(r,t){(function(e,n){for(var r=0,t=e.length;r<t;r++){var a=e[r];if(n(a,r))return A.some(a)}return A.none()})(e,function(e){return e.name===c.get()}).each(function(e){var n=U(e,t);r.setData({results:n})})}var a,i,o,c=1===e.length?N(T):N("All"),u=(a=function(e){t(e,e.getData().pattern)},i=40,o=null,{cancel:function(){null!==o&&(l.clearTimeout(o),o=null)},throttle:function(){for(var e=[],n=0;n<arguments.length;n++)e[n]=arguments[n];null!==o&&l.clearTimeout(o),o=l.setTimeout(function(){a.apply(null,e),o=null},i)}}),s={title:"Special Character",size:"normal",body:1===e.length?{type:"panel",items:n()}:{type:"tabpanel",tabs:g(e,function(e){return{title:e.name,name:e.name,items:n()}})},buttons:[{type:"cancel",name:"close",text:"Close",primary:!0}],initialData:{pattern:"",results:U(e[0],"")},onAction:function(e,n){"results"===n.name&&(d(r,n.value),e.close())},onTabChange:function(e,n){c.set(n.newTabName),u.throttle(e)},onChange:function(e,n){n.name===D&&u.throttle(e)}};r.windowManager.open(s).focus(D)},P=function(e,n){e.addCommand("mceShowCharmap",function(){I(e,n)})},j=tinymce.util.Tools.resolve("tinymce.util.Promise"),L=function(e){e.ui.registry.addButton("charmap",{icon:"insert-character",tooltip:"Special character",onAction:function(){return e.execCommand("mceShowCharmap")}}),e.ui.registry.addMenuItem("charmap",{icon:"insert-character",text:"Special character...",onAction:function(){return e.execCommand("mceShowCharmap")}})};!function M(){m.add("charmap",function(e){var t,r,n=E(e);return P(e,n),L(e),t=e,r=n[0],t.ui.registry.addAutocompleter("charmap",{ch:":",columns:"auto",minChars:2,fetch:function(n){return new j(function(e){e(U(r,n))})},onAction:function(e,n,r){t.selection.setRng(n),t.insertContent(r),e.hide()}}),z(e)})}()}(window);