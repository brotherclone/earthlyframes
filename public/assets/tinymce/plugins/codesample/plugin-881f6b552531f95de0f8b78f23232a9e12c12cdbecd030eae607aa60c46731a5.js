!function(){"use strict";function i(e){return e&&"PRE"===e.nodeName&&-1!==e.className.indexOf("language-")}function s(t){return function(e,n){return t(n)}}var e,n,t,a=tinymce.util.Tools.resolve("tinymce.PluginManager"),o=function(e){return function(){return e}},l=o(!1),u=o(!0),r=function(){return c},c=(e=function(e){return e.isNone()},{fold:function(e){return e()},is:l,isSome:l,isNone:u,getOr:t=function(e){return e},getOrThunk:n=function(e){return e()},getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:o(null),getOrUndefined:o(undefined),or:t,orThunk:n,map:r,each:function(){},bind:r,exists:l,forall:u,filter:r,equals:e,equals_:e,toArray:function(){return[]},toString:o("none()")}),d=function(t){var e=o(t),n=function(){return r},a=function(e){return e(t)},r={fold:function(e,n){return n(t)},is:function(e){return t===e},isSome:u,isNone:l,getOr:e,getOrThunk:e,getOrDie:e,getOrNull:e,getOrUndefined:e,or:n,orThunk:n,map:function(e){return d(e(t))},each:function(e){e(t)},bind:a,exists:a,forall:a,filter:function(e){return e(t)?r:c},toArray:function(){return[t]},toString:function(){return"some("+t+")"},equals:function(e){return e.is(t)},equals_:function(e,n){return e.fold(l,function(e){return n(t,e)})}};return r},p={some:d,none:r,from:function(e){return null===e||e===undefined?c:d(e)}},g=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),m="undefined"!=typeof window?window:Function("return this;")(),f={},h={exports:f},b={};!function(n,t,a,d){var e=window.Prism;window.Prism={manual:!0},function(e){"object"==typeof t&&void 0!==a?a.exports=e():"function"==typeof n&&n.amd?n([],e):("undefined"!=typeof window?window:void 0!==b?b:"undefined"!=typeof self?self:this).EphoxContactWrapper=e()}(function(){return function c(i,s,o){function l(n,e){if(!s[n]){if(!i[n]){var t="function"==typeof d&&d;if(!e&&t)return t(n,!0);if(u)return u(n,!0);var a=new Error("Cannot find module '"+n+"'");throw a.code="MODULE_NOT_FOUND",a}var r=s[n]={exports:{}};i[n][0].call(r.exports,function(e){return l(i[n][1][e]||e)},r,r.exports,c,i,s,o)}return s[n].exports}for(var u="function"==typeof d&&d,e=0;e<o.length;e++)l(o[e]);return l}({1:[function(){Prism.languages.c=Prism.languages.extend("clike",{"class-name":{pattern:/(\b(?:enum|struct)\s+)\w+/,lookbehind:!0},keyword:/\b(?:_Alignas|_Alignof|_Atomic|_Bool|_Complex|_Generic|_Imaginary|_Noreturn|_Static_assert|_Thread_local|asm|typeof|inline|auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)\b/,operator:/>>=?|<<=?|->|([-+&|:])\1|[?:~]|[-+*/%&|^!=<>]=?/,number:/(?:\b0x(?:[\da-f]+\.?[\da-f]*|\.[\da-f]+)(?:p[+-]?\d+)?|(?:\b\d+\.?\d*|\B\.\d+)(?:e[+-]?\d+)?)[ful]*/i}),Prism.languages.insertBefore("c","string",{macro:{pattern:/(^\s*)#\s*[a-z]+(?:[^\r\n\\]|\\(?:\r\n|[\s\S]))*/im,lookbehind:!0,alias:"property",inside:{string:{pattern:/(#\s*include\s*)(?:<.+?>|("|')(?:\\?.)+?\2)/,lookbehind:!0},directive:{pattern:/(#\s*)\b(?:define|defined|elif|else|endif|error|ifdef|ifndef|if|import|include|line|pragma|undef|using)\b/,lookbehind:!0,alias:"keyword"}}},constant:/\b(?:__FILE__|__LINE__|__DATE__|__TIME__|__TIMESTAMP__|__func__|EOF|NULL|SEEK_CUR|SEEK_END|SEEK_SET|stdin|stdout|stderr)\b/}),delete Prism.languages.c["boolean"]},{}],2:[function(){Prism.languages.clike={comment:[{pattern:/(^|[^\\])\/\*[\s\S]*?(?:\*\/|$)/,lookbehind:!0},{pattern:/(^|[^\\:])\/\/.*/,lookbehind:!0,greedy:!0}],string:{pattern:/(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,greedy:!0},"class-name":{pattern:/(\b(?:class|interface|extends|implements|trait|instanceof|new)\s+|\bcatch\s+\()[\w.\\]+/i,lookbehind:!0,inside:{punctuation:/[.\\]/}},keyword:/\b(?:if|else|while|do|for|return|in|instanceof|function|new|try|throw|catch|finally|null|break|continue)\b/,"boolean":/\b(?:true|false)\b/,"function":/\w+(?=\()/,number:/\b0x[\da-f]+\b|(?:\b\d+\.?\d*|\B\.\d+)(?:e[+-]?\d+)?/i,operator:/[<>]=?|[!=]=?=?|--?|\+\+?|&&?|\|\|?|[?*/~^%]/,punctuation:/[{}[\];(),.:]/}},{}],3:[function(e,t){(function(e){var n=function(u){function C(e,n,t,a,r){this.type=e,this.content=n,this.alias=t,this.length=0|(a||"").length,this.greedy=!!r}var c=/\blang(?:uage)?-([\w-]+)\b/i,n=0,O={manual:u.Prism&&u.Prism.manual,disableWorkerMessageHandler:u.Prism&&u.Prism.disableWorkerMessageHandler,util:{encode:function(e){return e instanceof C?new C(e.type,O.util.encode(e.content),e.alias):Array.isArray(e)?e.map(O.util.encode):e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/\u00a0/g," ")},type:function(e){return Object.prototype.toString.call(e).slice(8,-1)},objId:function(e){return e.__id||Object.defineProperty(e,"__id",{value:++n}),e.__id},clone:function s(e,t){var a,n,r=O.util.type(e);switch(t=t||{},r){case"Object":if(n=O.util.objId(e),t[n])return t[n];for(var i in a={},t[n]=a,e)e.hasOwnProperty(i)&&(a[i]=s(e[i],t));return a;case"Array":return n=O.util.objId(e),t[n]?t[n]:(a=[],t[n]=a,e.forEach(function(e,n){a[n]=s(e,t)}),a);default:return e}},getLanguage:function(e){for(;e&&!c.test(e.className);)e=e.parentElement;return e?(e.className.match(c)||[,"none"])[1].toLowerCase():"none"},currentScript:function(){if("undefined"==typeof document)return null;if("currentScript"in document)return document.currentScript;try{throw new Error}catch(a){var e=(/at [^(\r\n]*\((.*):.+:.+\)$/i.exec(a.stack)||[])[1];if(e){var n=document.getElementsByTagName("script");for(var t in n)if(n[t].src==e)return n[t]}return null}}},languages:{extend:function(e,n){var t=O.util.clone(O.languages[e]);for(var a in n)t[a]=n[a];return t},insertBefore:function(t,e,n,a){var r=(a=a||O.languages)[t],i={};for(var s in r)if(r.hasOwnProperty(s)){if(s==e)for(var o in n)n.hasOwnProperty(o)&&(i[o]=n[o]);n.hasOwnProperty(s)||(i[s]=r[s])}var l=a[t];return a[t]=i,O.languages.DFS(O.languages,function(e,n){n===l&&e!=t&&(this[e]=i)}),i},DFS:function l(e,n,t,a){a=a||{};var r,i,s=O.util.objId;for(var o in e)e.hasOwnProperty(o)&&(n.call(e,o,e[o],t||o),r=e[o],"Object"!==(i=O.util.type(r))||a[s(r)]?"Array"!==i||a[s(r)]||(a[s(r)]=!0,l(r,n,o,a)):(a[s(r)]=!0,l(r,n,null,a)))}},plugins:{},highlightAll:function(e,n){O.highlightAllUnder(document,e,n)},highlightAllUnder:function(e,n,t){var a={callback:t,container:e,selector:'code[class*="language-"], [class*="language-"] code, code[class*="lang-"], [class*="lang-"] code'};O.hooks.run("before-highlightall",a),a.elements=Array.prototype.slice.apply(a.container.querySelectorAll(a.selector)),O.hooks.run("before-all-elements-highlight",a);for(var r,i=0;r=a.elements[i++];)O.highlightElement(r,!0===n,a.callback)},highlightElement:function(e,n,t){function a(e){l.highlightedCode=e,O.hooks.run("before-insert",l),l.element.innerHTML=l.highlightedCode,O.hooks.run("after-highlight",l),O.hooks.run("complete",l),t&&t.call(l.element)}var r=O.util.getLanguage(e),i=O.languages[r];e.className=e.className.replace(c,"").replace(/\s+/g," ")+" language-"+r;var s=e.parentNode;s&&"pre"===s.nodeName.toLowerCase()&&(s.className=s.className.replace(c,"").replace(/\s+/g," ")+" language-"+r);var o,l={element:e,language:r,grammar:i,code:e.textContent};if(O.hooks.run("before-sanity-check",l),!l.code)return O.hooks.run("complete",l),void(t&&t.call(l.element));O.hooks.run("before-highlight",l),l.grammar?n&&u.Worker?((o=new Worker(O.filename)).onmessage=function(e){a(e.data)},o.postMessage(JSON.stringify({language:l.language,code:l.code,immediateClose:!0}))):a(O.highlight(l.code,l.grammar,l.language)):a(O.util.encode(l.code))},highlight:function(e,n,t){var a={code:e,grammar:n,language:t};return O.hooks.run("before-tokenize",a),a.tokens=O.tokenize(a.code,a.grammar),O.hooks.run("after-tokenize",a),C.stringify(O.util.encode(a.tokens),a.language)},matchGrammar:function(e,n,t,a,r,i,s){for(var o in t)if(t.hasOwnProperty(o)&&t[o])for(var l=t[o],u=(l=Array.isArray(l)?l:[l],0);u<l.length;++u){if(s&&s==o+","+u)return;var c,d=l[u],p=d.inside,g=!!d.lookbehind,m=!!d.greedy,f=0,h=d.alias;m&&!d.pattern.global&&(c=d.pattern.toString().match(/[imsuy]*$/)[0],d.pattern=RegExp(d.pattern.source,c+"g")),d=d.pattern||d;for(var b=a,y=r;b<n.length;y+=n[b].length,++b){var w=n[b];if(n.length>e.length)return;if(!(w instanceof C)){if(m&&b!=n.length-1){if(d.lastIndex=y,!(P=d.exec(e)))break;for(var v=P.index+(g&&P[1]?P[1].length:0),k=P.index+P[0].length,x=b,_=y,F=n.length;x<F&&(_<k||!n[x].type&&!n[x-1].greedy);++x)(_+=n[x].length)<=v&&(++b,y=_);if(n[b]instanceof C)continue;A=x-b,w=e.slice(y,_),P.index-=y}else{d.lastIndex=0;var P=d.exec(w),A=1}if(P){g&&(f=P[1]?P[1].length:0);k=(v=P.index+f)+(P=P[0].slice(f)).length;var S=w.slice(0,v),j=w.slice(k),$=[b,A];S&&(++b,y+=S.length,$.push(S));var E=new C(o,p?O.tokenize(P,p):P,h,P,m);if($.push(E),j&&$.push(j),Array.prototype.splice.apply(n,$),1!=A&&O.matchGrammar(e,n,t,b,y,!0,o+","+u),i)break}else if(i)break}}}},tokenize:function(e,n){var t=[e],a=n.rest;if(a){for(var r in a)n[r]=a[r];delete n.rest}return O.matchGrammar(e,t,n,0,0,!1),t},hooks:{all:{},add:function(e,n){var t=O.hooks.all;t[e]=t[e]||[],t[e].push(n)},run:function(e,n){var t=O.hooks.all[e];if(t&&t.length)for(var a,r=0;a=t[r++];)a(n)}},Token:C};if(u.Prism=O,C.stringify=function(e,n){if("string"==typeof e)return e;if(Array.isArray(e))return e.map(function(e){return C.stringify(e,n)}).join("");var t,a={type:e.type,content:C.stringify(e.content,n),tag:"span",classes:["token",e.type],attributes:{},language:n};e.alias&&(t=Array.isArray(e.alias)?e.alias:[e.alias],Array.prototype.push.apply(a.classes,t)),O.hooks.run("wrap",a);var r=Object.keys(a.attributes).map(function(e){return e+'="'+(a.attributes[e]||"").replace(/"/g,"&quot;")+'"'}).join(" ");return"<"+a.tag+' class="'+a.classes.join(" ")+'"'+(r?" "+r:"")+">"+a.content+"</"+a.tag+">"},!u.document)return u.addEventListener&&(O.disableWorkerMessageHandler||u.addEventListener("message",function(e){var n=JSON.parse(e.data),t=n.language,a=n.code,r=n.immediateClose;u.postMessage(O.highlight(a,O.languages[t],t)),r&&u.close()},!1)),O;var e,t,a=O.util.currentScript();return a&&(O.filename=a.src,a.hasAttribute("data-manual")&&(O.manual=!0)),O.manual||(e=function(){O.manual||O.highlightAll()},"loading"===(t=document.readyState)||"interactive"===t&&a&&a.defer?document.addEventListener("DOMContentLoaded",e):window.requestAnimationFrame?window.requestAnimationFrame(e):window.setTimeout(e,16)),O}("undefined"!=typeof window?window:"undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?self:{});void 0!==t&&t.exports&&(t.exports=n),void 0!==e&&(e.Prism=n)}).call(this,void 0!==b?b:"undefined"!=typeof self?self:"undefined"!=typeof window?window:{})},{}],4:[function(){Prism.languages.cpp=Prism.languages.extend("c",{"class-name":{pattern:/(\b(?:class|enum|struct)\s+)\w+/,lookbehind:!0},keyword:/\b(?:alignas|alignof|asm|auto|bool|break|case|catch|char|char16_t|char32_t|class|compl|const|constexpr|const_cast|continue|decltype|default|delete|do|double|dynamic_cast|else|enum|explicit|export|extern|float|for|friend|goto|if|inline|int|int8_t|int16_t|int32_t|int64_t|uint8_t|uint16_t|uint32_t|uint64_t|long|mutable|namespace|new|noexcept|nullptr|operator|private|protected|public|register|reinterpret_cast|return|short|signed|sizeof|static|static_assert|static_cast|struct|switch|template|this|thread_local|throw|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while)\b/,number:{pattern:/(?:\b0b[01']+|\b0x(?:[\da-f']+\.?[\da-f']*|\.[\da-f']+)(?:p[+-]?[\d']+)?|(?:\b[\d']+\.?[\d']*|\B\.[\d']+)(?:e[+-]?[\d']+)?)[ful]*/i,greedy:!0},operator:/>>=?|<<=?|->|([-+&|:])\1|[?:~]|[-+*/%&|^!=<>]=?|\b(?:and|and_eq|bitand|bitor|not|not_eq|or|or_eq|xor|xor_eq)\b/,"boolean":/\b(?:true|false)\b/}),Prism.languages.insertBefore("cpp","string",{"raw-string":{pattern:/R"([^()\\ ]{0,16})\([\s\S]*?\)\1"/,alias:"string",greedy:!0}})},{}],5:[function(){Prism.languages.csharp=Prism.languages.extend("clike",{keyword:/\b(?:abstract|add|alias|as|ascending|async|await|base|bool|break|byte|case|catch|char|checked|class|const|continue|decimal|default|delegate|descending|do|double|dynamic|else|enum|event|explicit|extern|false|finally|fixed|float|for|foreach|from|get|global|goto|group|if|implicit|in|int|interface|internal|into|is|join|let|lock|long|namespace|new|null|object|operator|orderby|out|override|params|partial|private|protected|public|readonly|ref|remove|return|sbyte|sealed|select|set|short|sizeof|stackalloc|static|string|struct|switch|this|throw|true|try|typeof|uint|ulong|unchecked|unsafe|ushort|using|value|var|virtual|void|volatile|where|while|yield)\b/,string:[{pattern:/@("|')(?:\1\1|\\[\s\S]|(?!\1)[^\\])*\1/,greedy:!0},{pattern:/("|')(?:\\.|(?!\1)[^\\\r\n])*?\1/,greedy:!0}],"class-name":[{pattern:/\b[A-Z]\w*(?:\.\w+)*\b(?=\s+\w+)/,inside:{punctuation:/\./}},{pattern:/(\[)[A-Z]\w*(?:\.\w+)*\b/,lookbehind:!0,inside:{punctuation:/\./}},{pattern:/(\b(?:class|interface)\s+[A-Z]\w*(?:\.\w+)*\s*:\s*)[A-Z]\w*(?:\.\w+)*\b/,lookbehind:!0,inside:{punctuation:/\./}},{pattern:/((?:\b(?:class|interface|new)\s+)|(?:catch\s+\())[A-Z]\w*(?:\.\w+)*\b/,lookbehind:!0,inside:{punctuation:/\./}}],number:/\b0x[\da-f]+\b|(?:\b\d+\.?\d*|\B\.\d+)f?/i,operator:/>>=?|<<=?|[-=]>|([-+&|?])\1|~|[-+*/%&|^!=<>]=?/,punctuation:/\?\.?|::|[{}[\];(),.:]/}),Prism.languages.insertBefore("csharp","class-name",{"generic-method":{pattern:/\w+\s*<[^>\r\n]+?>\s*(?=\()/,inside:{"function":/^\w+/,"class-name":{pattern:/\b[A-Z]\w*(?:\.\w+)*\b/,inside:{punctuation:/\./}},keyword:Prism.languages.csharp.keyword,punctuation:/[<>(),.:]/}},preprocessor:{pattern:/(^\s*)#.*/m,lookbehind:!0,alias:"property",inside:{directive:{pattern:/(\s*#)\b(?:define|elif|else|endif|endregion|error|if|line|pragma|region|undef|warning)\b/,lookbehind:!0,alias:"keyword"}}}}),Prism.languages.dotnet=Prism.languages.cs=Prism.languages.csharp},{}],6:[function(){!function(e){var n=/("|')(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/;e.languages.css={comment:/\/\*[\s\S]*?\*\//,atrule:{pattern:/@[\w-]+[\s\S]*?(?:;|(?=\s*\{))/,inside:{rule:/@[\w-]+/}},url:{pattern:RegExp("url\\((?:"+n.source+"|[^\n\r()]*)\\)","i"),inside:{"function":/^url/i,punctuation:/^\(|\)$/}},selector:RegExp("[^{}\\s](?:[^{};\"']|"+n.source+")*?(?=\\s*\\{)"),string:{pattern:n,greedy:!0},property:/[-_a-z\xA0-\uFFFF][-\w\xA0-\uFFFF]*(?=\s*:)/i,important:/!important\b/i,"function":/[-a-z0-9]+(?=\()/i,punctuation:/[(){};:,]/},e.languages.css.atrule.inside.rest=e.languages.css;var t=e.languages.markup;t&&(t.tag.addInlined("style","css"),e.languages.insertBefore("inside","attr-value",{"style-attr":{pattern:/\s*style=("|')(?:\\[\s\S]|(?!\1)[^\\])*\1/i,inside:{"attr-name":{pattern:/^\s*style/i,inside:t.tag.inside},punctuation:/^\s*=\s*['"]|['"]\s*$/,"attr-value":{pattern:/.+/i,inside:e.languages.css}},alias:"language-css"}},t.tag))}(Prism)},{}],7:[function(){var e,n,t;n=/\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|exports|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|module|native|new|null|open|opens|package|private|protected|provides|public|requires|return|short|static|strictfp|super|switch|synchronized|this|throw|throws|to|transient|transitive|try|uses|var|void|volatile|while|with|yield)\b/,t=/\b[A-Z](?:\w*[a-z]\w*)?\b/,(e=Prism).languages.java=e.languages.extend("clike",{"class-name":[t,/\b[A-Z]\w*(?=\s+\w+\s*[;,=())])/],keyword:n,"function":[e.languages.clike["function"],{pattern:/(\:\:)[a-z_]\w*/,lookbehind:!0}],number:/\b0b[01][01_]*L?\b|\b0x[\da-f_]*\.?[\da-f_p+-]+\b|(?:\b\d[\d_]*\.?[\d_]*|\B\.\d[\d_]*)(?:e[+-]?\d[\d_]*)?[dfl]?/i,operator:{pattern:/(^|[^.])(?:<<=?|>>>?=?|->|--|\+\+|&&|\|\||::|[?:~]|[-+*/%&|^!=<>]=?)/m,lookbehind:!0}}),e.languages.insertBefore("java","string",{"triple-quoted-string":{pattern:/"""[ \t]*[\r\n](?:(?:"|"")?(?:\\.|[^"\\]))*"""/,greedy:!0,alias:"string"}}),e.languages.insertBefore("java","class-name",{annotation:{alias:"punctuation",pattern:/(^|[^.])@\w+/,lookbehind:!0},namespace:{pattern:/(\b(?:exports|import(?:\s+static)?|module|open|opens|package|provides|requires|to|transitive|uses|with)\s+)[a-z]\w*(?:\.[a-z]\w*)+/,lookbehind:!0,inside:{punctuation:/\./}},generics:{pattern:/<(?:[\w\s,.&?]|<(?:[\w\s,.&?]|<(?:[\w\s,.&?]|<[\w\s,.&?]*>)*>)*>)*>/,inside:{"class-name":t,keyword:n,punctuation:/[<>(),.:]/,operator:/[?&|]/}}})},{}],8:[function(){Prism.languages.javascript=Prism.languages.extend("clike",{"class-name":[Prism.languages.clike["class-name"],{pattern:/(^|[^$\w\xA0-\uFFFF])[_$A-Z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\.(?:prototype|constructor))/,lookbehind:!0}],keyword:[{pattern:/((?:^|})\s*)(?:catch|finally)\b/,lookbehind:!0},{pattern:/(^|[^.]|\.\.\.\s*)\b(?:as|async(?=\s*(?:function\b|\(|[$\w\xA0-\uFFFF]|$))|await|break|case|class|const|continue|debugger|default|delete|do|else|enum|export|extends|for|from|function|get|if|implements|import|in|instanceof|interface|let|new|null|of|package|private|protected|public|return|set|static|super|switch|this|throw|try|typeof|undefined|var|void|while|with|yield)\b/,lookbehind:!0}],number:/\b(?:(?:0[xX](?:[\dA-Fa-f](?:_[\dA-Fa-f])?)+|0[bB](?:[01](?:_[01])?)+|0[oO](?:[0-7](?:_[0-7])?)+)n?|(?:\d(?:_\d)?)+n|NaN|Infinity)\b|(?:\b(?:\d(?:_\d)?)+\.?(?:\d(?:_\d)?)*|\B\.(?:\d(?:_\d)?)+)(?:[Ee][+-]?(?:\d(?:_\d)?)+)?/,"function":/#?[_$a-zA-Z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\s*(?:\.\s*(?:apply|bind|call)\s*)?\()/,operator:/--|\+\+|\*\*=?|=>|&&|\|\||[!=]==|<<=?|>>>?=?|[-+*/%&|^!=<>]=?|\.{3}|\?[.?]?|[~:]/}),Prism.languages.javascript["class-name"][0].pattern=/(\b(?:class|interface|extends|implements|instanceof|new)\s+)[\w.\\]+/,Prism.languages.insertBefore("javascript","keyword",{regex:{pattern:/((?:^|[^$\w\xA0-\uFFFF."'\])\s])\s*)\/(?:\[(?:[^\]\\\r\n]|\\.)*]|\\.|[^/\\\[\r\n])+\/[gimyus]{0,6}(?=(?:\s|\/\*[\s\S]*?\*\/)*(?:$|[\r\n,.;:})\]]|\/\/))/,lookbehind:!0,greedy:!0},"function-variable":{pattern:/#?[_$a-zA-Z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\s*[=:]\s*(?:async\s*)?(?:\bfunction\b|(?:\((?:[^()]|\([^()]*\))*\)|[_$a-zA-Z\xA0-\uFFFF][$\w\xA0-\uFFFF]*)\s*=>))/,alias:"function"},parameter:[{pattern:/(function(?:\s+[_$A-Za-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*)?\s*\(\s*)(?!\s)(?:[^()]|\([^()]*\))+?(?=\s*\))/,lookbehind:!0,inside:Prism.languages.javascript},{pattern:/[_$a-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\s*=>)/i,inside:Prism.languages.javascript},{pattern:/(\(\s*)(?!\s)(?:[^()]|\([^()]*\))+?(?=\s*\)\s*=>)/,lookbehind:!0,inside:Prism.languages.javascript},{pattern:/((?:\b|\s|^)(?!(?:as|async|await|break|case|catch|class|const|continue|debugger|default|delete|do|else|enum|export|extends|finally|for|from|function|get|if|implements|import|in|instanceof|interface|let|new|null|of|package|private|protected|public|return|set|static|super|switch|this|throw|try|typeof|undefined|var|void|while|with|yield)(?![$\w\xA0-\uFFFF]))(?:[_$A-Za-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*\s*)\(\s*)(?!\s)(?:[^()]|\([^()]*\))+?(?=\s*\)\s*\{)/,lookbehind:!0,inside:Prism.languages.javascript}],constant:/\b[A-Z](?:[A-Z_]|\dx?)*\b/}),Prism.languages.insertBefore("javascript","string",{"template-string":{pattern:/`(?:\\[\s\S]|\${(?:[^{}]|{(?:[^{}]|{[^}]*})*})+}|(?!\${)[^\\`])*`/,greedy:!0,inside:{"template-punctuation":{pattern:/^`|`$/,alias:"string"},interpolation:{pattern:/((?:^|[^\\])(?:\\{2})*)\${(?:[^{}]|{(?:[^{}]|{[^}]*})*})+}/,lookbehind:!0,inside:{"interpolation-punctuation":{pattern:/^\${|}$/,alias:"punctuation"},rest:Prism.languages.javascript}},string:/[\s\S]+/}}}),Prism.languages.markup&&Prism.languages.markup.tag.addInlined("script","javascript"),Prism.languages.js=Prism.languages.javascript},{}],9:[function(){function b(e,n){return"___"+e.toUpperCase()+n+"___"}var y;y=Prism,Object.defineProperties(y.languages["markup-templating"]={},{buildPlaceholders:{value:function(a,r,e,i){var s;a.language===r&&(s=a.tokenStack=[],a.code=a.code.replace(e,function(e){if("function"==typeof i&&!i(e))return e;for(var n,t=s.length;-1!==a.code.indexOf(n=b(r,t));)++t;return s[t]=e,n}),a.grammar=y.languages.markup)}},tokenizePlaceholders:{value:function(p,g){var m,f;p.language===g&&p.tokenStack&&(p.grammar=y.languages[g],m=0,f=Object.keys(p.tokenStack),function h(e){for(var n=0;n<e.length&&!(m>=f.length);n++){var t,a,r,i,s,o,l,u,c,d=e[n];"string"==typeof d||d.content&&"string"==typeof d.content?(t=f[m],a=p.tokenStack[t],r="string"==typeof d?d:d.content,i=b(g,t),-1<(s=r.indexOf(i))&&(++m,o=r.substring(0,s),l=new y.Token(g,y.tokenize(a,p.grammar),"language-"+g,a),u=r.substring(s+i.length),c=[],o&&c.push.apply(c,h([o])),c.push(l),u&&c.push.apply(c,h([u])),"string"==typeof d?e.splice.apply(e,[n,1].concat(c)):d.content=c)):d.content&&h(d.content)}return e}(p.tokens))}}})},{}],10:[function(){Prism.languages.markup={comment:/<!--[\s\S]*?-->/,prolog:/<\?[\s\S]+?\?>/,doctype:{pattern:/<!DOCTYPE(?:[^>"'[\]]|"[^"]*"|'[^']*')+(?:\[(?:(?!<!--)[^"'\]]|"[^"]*"|'[^']*'|<!--[\s\S]*?-->)*\]\s*)?>/i,greedy:!0},cdata:/<!\[CDATA\[[\s\S]*?]]>/i,tag:{pattern:/<\/?(?!\d)[^\s>\/=$<%]+(?:\s(?:\s*[^\s>\/=]+(?:\s*=\s*(?:"[^"]*"|'[^']*'|[^\s'">=]+(?=[\s>]))|(?=[\s/>])))+)?\s*\/?>/i,greedy:!0,inside:{tag:{pattern:/^<\/?[^\s>\/]+/i,inside:{punctuation:/^<\/?/,namespace:/^[^\s>\/:]+:/}},"attr-value":{pattern:/=\s*(?:"[^"]*"|'[^']*'|[^\s'">=]+)/i,inside:{punctuation:[/^=/,{pattern:/^(\s*)["']|["']$/,lookbehind:!0}]}},punctuation:/\/?>/,"attr-name":{pattern:/[^\s>\/]+/,inside:{namespace:/^[^\s>\/:]+:/}}}},entity:/&#?[\da-z]{1,8};/i},Prism.languages.markup.tag.inside["attr-value"].inside.entity=Prism.languages.markup.entity,Prism.hooks.add("wrap",function(e){"entity"===e.type&&(e.attributes.title=e.content.replace(/&amp;/,"&"))}),Object.defineProperty(Prism.languages.markup.tag,"addInlined",{value:function(e,n){var t={};t["language-"+n]={pattern:/(^<!\[CDATA\[)[\s\S]+?(?=\]\]>$)/i,lookbehind:!0,inside:Prism.languages[n]},t.cdata=/^<!\[CDATA\[|\]\]>$/i;var a={"included-cdata":{pattern:/<!\[CDATA\[[\s\S]*?\]\]>/i,inside:t}};a["language-"+n]={pattern:/[\s\S]+/,inside:Prism.languages[n]};var r={};r[e]={pattern:RegExp(/(<__[\s\S]*?>)(?:<!\[CDATA\[[\s\S]*?\]\]>\s*|[\s\S])*?(?=<\/__>)/.source.replace(/__/g,e),"i"),lookbehind:!0,greedy:!0,inside:a},Prism.languages.insertBefore("markup","cdata",r)}}),Prism.languages.xml=Prism.languages.extend("markup",{}),Prism.languages.html=Prism.languages.markup,Prism.languages.mathml=Prism.languages.markup,Prism.languages.svg=Prism.languages.markup},{}],11:[function(){!function(n){n.languages.php=n.languages.extend("clike",{keyword:/\b(?:__halt_compiler|abstract|and|array|as|break|callable|case|catch|class|clone|const|continue|declare|default|die|do|echo|else|elseif|empty|enddeclare|endfor|endforeach|endif|endswitch|endwhile|eval|exit|extends|final|finally|for|foreach|function|global|goto|if|implements|include|include_once|instanceof|insteadof|interface|isset|list|namespace|new|or|parent|print|private|protected|public|require|require_once|return|static|switch|throw|trait|try|unset|use|var|while|xor|yield)\b/i,"boolean":{pattern:/\b(?:false|true)\b/i,alias:"constant"},constant:[/\b[A-Z_][A-Z0-9_]*\b/,/\b(?:null)\b/i],comment:{pattern:/(^|[^\\])(?:\/\*[\s\S]*?\*\/|\/\/.*)/,lookbehind:!0}}),n.languages.insertBefore("php","string",{"shell-comment":{pattern:/(^|[^\\])#.*/,lookbehind:!0,alias:"comment"}}),n.languages.insertBefore("php","comment",{delimiter:{pattern:/\?>$|^<\?(?:php(?=\s)|=)?/i,alias:"important"}}),n.languages.insertBefore("php","keyword",{variable:/\$+(?:\w+\b|(?={))/i,"package":{pattern:/(\\|namespace\s+|use\s+)[\w\\]+/,lookbehind:!0,inside:{punctuation:/\\/}}}),n.languages.insertBefore("php","operator",{property:{pattern:/(->)[\w]+/,lookbehind:!0}});var e={pattern:/{\$(?:{(?:{[^{}]+}|[^{}]+)}|[^{}])+}|(^|[^\\{])\$+(?:\w+(?:\[.+?]|->\w+)*)/,lookbehind:!0,inside:n.languages.php};n.languages.insertBefore("php","string",{"nowdoc-string":{pattern:/<<<'([^']+)'(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\1;/,greedy:!0,alias:"string",inside:{delimiter:{pattern:/^<<<'[^']+'|[a-z_]\w*;$/i,alias:"symbol",inside:{punctuation:/^<<<'?|[';]$/}}}},"heredoc-string":{pattern:/<<<(?:"([^"]+)"(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\1;|([a-z_]\w*)(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\2;)/i,greedy:!0,alias:"string",inside:{delimiter:{pattern:/^<<<(?:"[^"]+"|[a-z_]\w*)|[a-z_]\w*;$/i,alias:"symbol",inside:{punctuation:/^<<<"?|[";]$/}},interpolation:e}},"single-quoted-string":{pattern:/'(?:\\[\s\S]|[^\\'])*'/,greedy:!0,alias:"string"},"double-quoted-string":{pattern:/"(?:\\[\s\S]|[^\\"])*"/,greedy:!0,alias:"string",inside:{interpolation:e}}}),delete n.languages.php.string,n.hooks.add("before-tokenize",function(e){/<\?/.test(e.code)&&n.languages["markup-templating"].buildPlaceholders(e,"php",/<\?(?:[^"'/#]|\/(?![*/])|("|')(?:\\[\s\S]|(?!\1)[^\\])*\1|(?:\/\/|#)(?:[^?\n\r]|\?(?!>))*(?=$|\?>|[\r\n])|\/\*[\s\S]*?(?:\*\/|$))*?(?:\?>|$)/gi)}),n.hooks.add("after-tokenize",function(e){n.languages["markup-templating"].tokenizePlaceholders(e,"php")})}(Prism)},{}],12:[function(){Prism.languages.python={comment:{pattern:/(^|[^\\])#.*/,lookbehind:!0},"string-interpolation":{pattern:/(?:f|rf|fr)(?:("""|''')[\s\S]+?\1|("|')(?:\\.|(?!\2)[^\\\r\n])*\2)/i,greedy:!0,inside:{interpolation:{pattern:/((?:^|[^{])(?:{{)*){(?!{)(?:[^{}]|{(?!{)(?:[^{}]|{(?!{)(?:[^{}])+})+})+}/,lookbehind:!0,inside:{"format-spec":{pattern:/(:)[^:(){}]+(?=}$)/,lookbehind:!0},"conversion-option":{pattern:/![sra](?=[:}]$)/,alias:"punctuation"},rest:null}},string:/[\s\S]+/}},"triple-quoted-string":{pattern:/(?:[rub]|rb|br)?("""|''')[\s\S]+?\1/i,greedy:!0,alias:"string"},string:{pattern:/(?:[rub]|rb|br)?("|')(?:\\.|(?!\1)[^\\\r\n])*\1/i,greedy:!0},"function":{pattern:/((?:^|\s)def[ \t]+)[a-zA-Z_]\w*(?=\s*\()/g,lookbehind:!0},"class-name":{pattern:/(\bclass\s+)\w+/i,lookbehind:!0},decorator:{pattern:/(^\s*)@\w+(?:\.\w+)*/im,lookbehind:!0,alias:["annotation","punctuation"],inside:{punctuation:/\./}},keyword:/\b(?:and|as|assert|async|await|break|class|continue|def|del|elif|else|except|exec|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|print|raise|return|try|while|with|yield)\b/,builtin:/\b(?:__import__|abs|all|any|apply|ascii|basestring|bin|bool|buffer|bytearray|bytes|callable|chr|classmethod|cmp|coerce|compile|complex|delattr|dict|dir|divmod|enumerate|eval|execfile|file|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|intern|isinstance|issubclass|iter|len|list|locals|long|map|max|memoryview|min|next|object|oct|open|ord|pow|property|range|raw_input|reduce|reload|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|unichr|unicode|vars|xrange|zip)\b/,"boolean":/\b(?:True|False|None)\b/,number:/(?:\b(?=\d)|\B(?=\.))(?:0[bo])?(?:(?:\d|0x[\da-f])[\da-f]*\.?\d*|\.\d+)(?:e[+-]?\d+)?j?\b/i,operator:/[-+%=]=?|!=|\*\*?=?|\/\/?=?|<[<=>]?|>[=>]?|[&|^~]/,punctuation:/[{}[\];(),.:]/},Prism.languages.python["string-interpolation"].inside.interpolation.inside.rest=Prism.languages.python,Prism.languages.py=Prism.languages.python},{}],13:[function(){!function(e){e.languages.ruby=e.languages.extend("clike",{comment:[/#.*/,{pattern:/^=begin\s[\s\S]*?^=end/m,greedy:!0}],"class-name":{pattern:/(\b(?:class)\s+|\bcatch\s+\()[\w.\\]+/i,lookbehind:!0,inside:{punctuation:/[.\\]/}},keyword:/\b(?:alias|and|BEGIN|begin|break|case|class|def|define_method|defined|do|each|else|elsif|END|end|ensure|extend|for|if|in|include|module|new|next|nil|not|or|prepend|protected|private|public|raise|redo|require|rescue|retry|return|self|super|then|throw|undef|unless|until|when|while|yield)\b/});var n={pattern:/#\{[^}]+\}/,inside:{delimiter:{pattern:/^#\{|\}$/,alias:"tag"},rest:e.languages.ruby}};delete e.languages.ruby["function"],e.languages.insertBefore("ruby","keyword",{regex:[{pattern:/%r([^a-zA-Z0-9\s{(\[<])(?:(?!\1)[^\\]|\\[\s\S])*\1[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\((?:[^()\\]|\\[\s\S])*\)[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\{(?:[^#{}\\]|#(?:\{[^}]+\})?|\\[\s\S])*\}[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\[(?:[^\[\]\\]|\\[\s\S])*\][gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r<(?:[^<>\\]|\\[\s\S])*>[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/(^|[^/])\/(?!\/)(?:\[.+?]|\\.|[^/\\\r\n])+\/[gim]{0,3}(?=\s*(?:$|[\r\n,.;})]))/,lookbehind:!0,greedy:!0}],variable:/[@$]+[a-zA-Z_]\w*(?:[?!]|\b)/,symbol:{pattern:/(^|[^:]):[a-zA-Z_]\w*(?:[?!]|\b)/,lookbehind:!0},"method-definition":{pattern:/(\bdef\s+)[\w.]+/,lookbehind:!0,inside:{"function":/\w+$/,rest:e.languages.ruby}}}),e.languages.insertBefore("ruby","number",{builtin:/\b(?:Array|Bignum|Binding|Class|Continuation|Dir|Exception|FalseClass|File|Stat|Fixnum|Float|Hash|Integer|IO|MatchData|Method|Module|NilClass|Numeric|Object|Proc|Range|Regexp|String|Struct|TMS|Symbol|ThreadGroup|Thread|Time|TrueClass)\b/,constant:/\b[A-Z]\w*(?:[?!]|\b)/}),e.languages.ruby.string=[{pattern:/%[qQiIwWxs]?([^a-zA-Z0-9\s{(\[<])(?:(?!\1)[^\\]|\\[\s\S])*\1/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\((?:[^()\\]|\\[\s\S])*\)/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\{(?:[^#{}\\]|#(?:\{[^}]+\})?|\\[\s\S])*\}/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\[(?:[^\[\]\\]|\\[\s\S])*\]/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?<(?:[^<>\\]|\\[\s\S])*>/,greedy:!0,inside:{interpolation:n}},{pattern:/("|')(?:#\{[^}]+\}|\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,greedy:!0,inside:{interpolation:n}}],e.languages.rb=e.languages.ruby}(Prism)},{}],14:[function(e,n){var t=e("prismjs/components/prism-core");e("prismjs/components/prism-clike"),e("prismjs/components/prism-markup-templating"),e("prismjs/components/prism-c"),e("prismjs/components/prism-cpp"),e("prismjs/components/prism-csharp"),e("prismjs/components/prism-css"),e("prismjs/components/prism-java"),e("prismjs/components/prism-javascript"),e("prismjs/components/prism-markup"),e("prismjs/components/prism-php"),e("prismjs/components/prism-python"),e("prismjs/components/prism-ruby"),n.exports={boltExport:t}},{"prismjs/components/prism-c":1,"prismjs/components/prism-clike":2,"prismjs/components/prism-core":3,"prismjs/components/prism-cpp":4,"prismjs/components/prism-csharp":5,"prismjs/components/prism-css":6,"prismjs/components/prism-java":7,"prismjs/components/prism-javascript":8,"prismjs/components/prism-markup":10,"prismjs/components/prism-markup-templating":9,"prismjs/components/prism-php":11,"prismjs/components/prism-python":12,"prismjs/components/prism-ruby":13}]},{},[14])(14)});window.Prism;window.Prism=e}(undefined,f,h,undefined);var y=h.exports.boltExport,w=function(e){return m.Prism&&e.getParam("codesample_global_prismjs",!1,"boolean")?m.Prism:y},v=function(e){var n=e.selection?e.selection.getNode():null;return i(n)?p.some(n):p.none()},k=function(i){var e,t,n=i.getParam("codesample_languages")||[{text:"HTML/XML",value:"markup"},{text:"JavaScript",value:"javascript"},{text:"CSS",value:"css"},{text:"PHP",value:"php"},{text:"Ruby",value:"ruby"},{text:"Python",value:"python"},{text:"Java",value:"java"},{text:"C",value:"c"},{text:"C#",value:"csharp"},{text:"C++",value:"cpp"}],a=(0===(e=n).length?p.none():p.some(e[0])).fold(function(){return""},function(e){return e.value}),r=(t=a,v(i).fold(function(){return t},function(e){var n=e.className.match(/language-(\w+)/);return n?n[1]:t})),s=v(i).fold(function(){return""},function(e){return e.textContent});i.windowManager.open({title:"Insert/Edit Code Sample",size:"large",body:{type:"panel",items:[{type:"selectbox",name:"language",label:"Language",items:n},{type:"textarea",name:"code",label:"Code view"}]},buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],initialData:{language:r,code:s},onSubmit:function(e){var n,t,a,r=e.getData();n=i,t=r.language,a=r.code,n.undoManager.transact(function(){var e=v(n);return a=g.DOM.encode(a),e.fold(function(){n.insertContent('<pre id="__new" class="language-'+t+'">'+a+"</pre>"),n.selection.select(n.$("#__new").removeAttr("id")[0])},function(e){n.dom.setAttrib(e,"class","language-"+t),e.innerHTML=a,w(n).highlightElement(e),n.selection.select(e)})}),e.close()}})},x=function(a){a.ui.registry.addToggleButton("codesample",{icon:"code-sample",tooltip:"Insert/edit code sample",onAction:function(){return k(a)},onSetup:function(t){var e=function(){var e,n;t.setActive((n=(e=a).selection.getStart(),e.dom.is(n,'pre[class*="language-"]')))};return a.on("NodeChange",e),function(){return a.off("NodeChange",e)}}}),a.ui.registry.addMenuItem("codesample",{text:"Code sample...",icon:"code-sample",onAction:function(){return k(a)}})};a.add("codesample",function(n){var t,r,a;r=(t=n).$,t.on("PreProcess",function(e){r("pre[contenteditable=false]",e.node).filter(s(i)).each(function(e,n){var t=r(n),a=n.textContent;t.attr("class",r.trim(t.attr("class"))),t.removeAttr("contentEditable"),t.empty().append(r("<code></code>").each(
function(){this.textContent=a}))})}),t.on("SetContent",function(){var e=r("pre").filter(s(i)).filter(function(e,n){return"false"!==n.contentEditable});e.length&&t.undoManager.transact(function(){e.each(function(e,n){r(n).find("br").each(function(e,n){n.parentNode.replaceChild(t.getDoc().createTextNode("\n"),n)}),n.contentEditable="false",n.innerHTML=t.dom.encode(n.textContent),w(t).highlightElement(n),n.className=r.trim(n.className)})})}),x(n),(a=n).addCommand("codesample",function(){var e=a.selection.getNode();a.selection.isCollapsed()||i(e)?k(a):a.formatter.toggle("code")}),n.on("dblclick",function(e){i(e.target)&&k(n)})})}();