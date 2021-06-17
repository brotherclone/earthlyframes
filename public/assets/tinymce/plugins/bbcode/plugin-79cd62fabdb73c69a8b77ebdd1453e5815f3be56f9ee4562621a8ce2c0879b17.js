/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.8.1 (2021-05-20)
 */
!function(){"use strict";var o=tinymce.util.Tools.resolve("tinymce.PluginManager"),e=tinymce.util.Tools.resolve("tinymce.util.Tools"),t=function(t){t=e.trim(t);var o=function(o,e){t=t.replace(o,e)};return o(/\n/gi,"<br />"),o(/\[b\]/gi,"<strong>"),o(/\[\/b\]/gi,"</strong>"),o(/\[i\]/gi,"<em>"),o(/\[\/i\]/gi,"</em>"),o(/\[u\]/gi,"<u>"),o(/\[\/u\]/gi,"</u>"),o(/\[url=([^\]]+)\](.*?)\[\/url\]/gi,'<a href="$1">$2</a>'),o(/\[url\](.*?)\[\/url\]/gi,'<a href="$1">$1</a>'),o(/\[img\](.*?)\[\/img\]/gi,'<img src="$1" />'),o(/\[color=(.*?)\](.*?)\[\/color\]/gi,'<font color="$1">$2</font>'),o(/\[code\](.*?)\[\/code\]/gi,'<span class="codeStyle">$1</span>&nbsp;'),o(/\[quote.*?\](.*?)\[\/quote\]/gi,'<span class="quoteStyle">$1</span>&nbsp;'),t};o.add("bbcode",function(o){o.on("BeforeSetContent",function(o){o.content=t(o.content)}),o.on("PostProcess",function(o){o.set&&(o.content=t(o.content)),o.get&&(o.content=function(t){t=e.trim(t);var o=function(o,e){t=t.replace(o,e)};return o(/<a.*?href=\"(.*?)\".*?>(.*?)<\/a>/gi,"[url=$1]$2[/url]"),o(/<font.*?color=\"(.*?)\".*?class=\"codeStyle\".*?>(.*?)<\/font>/gi,"[code][color=$1]$2[/color][/code]"),o(/<font.*?color=\"(.*?)\".*?class=\"quoteStyle\".*?>(.*?)<\/font>/gi,"[quote][color=$1]$2[/color][/quote]"),o(/<font.*?class=\"codeStyle\".*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[code][color=$1]$2[/color][/code]"),o(/<font.*?class=\"quoteStyle\".*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[quote][color=$1]$2[/color][/quote]"),o(/<span style=\"color: ?(.*?);\">(.*?)<\/span>/gi,"[color=$1]$2[/color]"),o(/<font.*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[color=$1]$2[/color]"),o(/<span style=\"font-size:(.*?);\">(.*?)<\/span>/gi,"[size=$1]$2[/size]"),o(/<font>(.*?)<\/font>/gi,"$1"),o(/<img.*?src=\"(.*?)\".*?\/>/gi,"[img]$1[/img]"),o(/<span class=\"codeStyle\">(.*?)<\/span>/gi,"[code]$1[/code]"),o(/<span class=\"quoteStyle\">(.*?)<\/span>/gi,"[quote]$1[/quote]"),o(/<strong class=\"codeStyle\">(.*?)<\/strong>/gi,"[code][b]$1[/b][/code]"),o(/<strong class=\"quoteStyle\">(.*?)<\/strong>/gi,"[quote][b]$1[/b][/quote]"),o(/<em class=\"codeStyle\">(.*?)<\/em>/gi,"[code][i]$1[/i][/code]"),o(/<em class=\"quoteStyle\">(.*?)<\/em>/gi,"[quote][i]$1[/i][/quote]"),o(/<u class=\"codeStyle\">(.*?)<\/u>/gi,"[code][u]$1[/u][/code]"),o(/<u class=\"quoteStyle\">(.*?)<\/u>/gi,"[quote][u]$1[/u][/quote]"),o(/<\/(strong|b)>/gi,"[/b]"),o(/<(strong|b)>/gi,"[b]"),o(/<\/(em|i)>/gi,"[/i]"),o(/<(em|i)>/gi,"[i]"),o(/<\/u>/gi,"[/u]"),o(/<span style=\"text-decoration: ?underline;\">(.*?)<\/span>/gi,"[u]$1[/u]"),o(/<u>/gi,"[u]"),o(/<blockquote[^>]*>/gi,"[quote]"),o(/<\/blockquote>/gi,"[/quote]"),o(/<br \/>/gi,"\n"),o(/<br\/>/gi,"\n"),o(/<br>/gi,"\n"),o(/<p>/gi,""),o(/<\/p>/gi,"\n"),o(/&nbsp;|\u00a0/gi," "),o(/&quot;/gi,'"'),o(/&lt;/gi,"<"),o(/&gt;/gi,">"),o(/&amp;/gi,"&"),t}(o.content))})})}();
