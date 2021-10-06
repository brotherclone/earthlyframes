/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.9.2 (2021-09-08)
 */
!function(){"use strict";function u(e){return e.getParam("pagebreak_split_block",!1)}function l(e){var a='<img src="'+n.transparentSrc+'" class="'+m+'" data-mce-resize="false" data-mce-placeholder />';return e?"<p>"+a+"</p>":a}var e=tinymce.util.Tools.resolve("tinymce.PluginManager"),n=tinymce.util.Tools.resolve("tinymce.Env"),m="mce-pagebreak";e.add("pagebreak",function(e){var a,n,o,i,t,r;function c(){return n.execCommand("mcePageBreak")}function g(){return u(o)}(a=e).addCommand("mcePageBreak",function(){a.insertContent(l(u(a)))}),(n=e).ui.registry.addButton("pagebreak",{icon:"page-break",tooltip:"Page break",onAction:c}),n.ui.registry.addMenuItem("pagebreak",{text:"Page break",icon:"page-break",onAction:c}),i=(o=e).getParam("pagebreak_separator","\x3c!-- pagebreak --\x3e"),t=new RegExp(i.replace(/[\?\.\*\[\]\(\)\{\}\+\^\$\:]/g,function(e){return"\\"+e}),"gi"),o.on("BeforeSetContent",function(e){e.content=e.content.replace(t,l(g()))}),o.on("PreInit",function(){o.serializer.addNodeFilter("img",function(e){for(var a,n,t,r=e.length;r--;)(t=(n=e[r]).attr("class"))&&-1!==t.indexOf(m)&&(a=n.parent,o.schema.getBlockElements()[a.name]&&g()?(a.type=3,a.value=i,a.raw=!0,n.remove()):(n.type=3,n.value=i,n.raw=!0))})}),(r=e).on("ResolveName",function(e){"IMG"===e.target.nodeName&&r.dom.hasClass(e.target,m)&&(e.name="pagebreak")})})}();
