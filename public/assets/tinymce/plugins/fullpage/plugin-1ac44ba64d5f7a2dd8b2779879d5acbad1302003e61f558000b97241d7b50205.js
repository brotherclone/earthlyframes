!function(){"use strict";var s=function(e){var t=e;return{get:function(){return t},set:function(e){t=e}}},e=tinymce.util.Tools.resolve("tinymce.PluginManager"),u=function(){return(u=Object.assign||function(e){for(var t,n=1,l=arguments.length;n<l;n++)for(var i in t=arguments[n])Object.prototype.hasOwnProperty.call(t,i)&&(e[i]=t[i]);return e}).apply(this,arguments)},p=tinymce.util.Tools.resolve("tinymce.util.Tools"),t=tinymce.util.Tools.resolve("tinymce.html.DomParser"),m=tinymce.util.Tools.resolve("tinymce.html.Node"),f=tinymce.util.Tools.resolve("tinymce.html.Serializer"),y=function(e){return e.getParam("fullpage_hide_in_source_view")},i=function(e){return e.getParam("fullpage_default_encoding")},g=function(e){return e.getParam("fullpage_default_font_family")},h=function(e){return e.getParam("fullpage_default_font_size")},v=function(e){return t({validate:!1,root_name:"#document"}).parse(e,{format:"xhtml"})},d=function(l,i){function e(e,t){return e.attr(t)||""}var t,n,o,r,a,c,s=(t=l,n=i.get(),a=v(n),(c={}).fontface=g(t),c.fontsize=h(t),7===(o=a.firstChild).type&&(c.xml_pi=!0,(r=/encoding="([^"]+)"/.exec(o.value))&&(c.docencoding=r[1])),(o=a.getAll("#doctype")[0])&&(c.doctype="<!DOCTYPE"+o.value+">"),(o=a.getAll("title")[0])&&o.firstChild&&(c.title=o.firstChild.value),p.each(a.getAll("meta"),function(e){var t,n=e.attr("name"),l=e.attr("http-equiv");n?c[n.toLowerCase()]=e.attr("content"):"Content-Type"===l&&(t=/charset\s*=\s*(.*)\s*/gi.exec(e.attr("content")))&&(c.docencoding=t[1])}),(o=a.getAll("html")[0])&&(c.langcode=e(o,"lang")||e(o,"xml:lang")),c.stylesheets=[],p.each(a.getAll("link"),function(e){"stylesheet"===e.attr("rel")&&c.stylesheets.push(e.attr("href"))}),(o=a.getAll("body")[0])&&(c.langdir=e(o,"dir"),c.style=e(o,"style"),c.visited_color=e(o,"vlink"),c.link_color=e(o,"link"),c.active_color=e(o,"alink")),c),d=u(u({},{title:"",keywords:"",description:"",robots:"",author:"",docencoding:""}),s);l.windowManager.open({title:"Metadata and Document Properties",size:"normal",body:{type:"panel",items:[{name:"title",type:"input",label:"Title"},{name:"keywords",type:"input",label:"Keywords"},{name:"description",type:"input",label:"Description"},{name:"robots",type:"input",label:"Robots"},{name:"author",type:"input",label:"Author"},{name:"docencoding",type:"input",label:"Encoding"}]},buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],initialData:d,onSubmit:function(e){var t=e.getData(),n=function(e,o,t){function n(e,t,n){e.attr(t,n||undefined)}function r(e){i.firstChild?i.insert(e,i.firstChild):i.append(e)}var a,l,i,c=e.dom,s=v(t);(i=s.getAll("head")[0])||(a=s.getAll("html")[0],i=new m("head",1),a.firstChild?a.insert(i,a.firstChild,!0):a.append(i)),a=s.firstChild,o.xml_pi?(l='version="1.0"',o.docencoding&&(l+=' encoding="'+o.docencoding+'"'),7!==a.type&&(a=new m("xml",7),s.insert(a,s.firstChild,!0)),a.value=l):a&&7===a.type&&a.remove(),a=s.getAll("#doctype")[0],o.doctype?(a||(a=new m("#doctype",10),o.xml_pi?s.insert(a,s.firstChild):r(a)),a.value=o.doctype.substring(9,o.doctype.length-1)):a&&a.remove(),a=null,p.each(s.getAll("meta"),function(e){"Content-Type"===e.attr("http-equiv")&&(a=e)}),o.docencoding?(a||((a=new m("meta",1)).attr("http-equiv","Content-Type"),a.shortEnded=!0,r(a)),a.attr("content","text/html; charset="+o.docencoding)):a&&a.remove(),a=s.getAll("title")[0],o.title?(a?a.empty():r(a=new m("title",1)),a.append(new m("#text",3)).value=o.title):a&&a.remove(),p.each("keywords,description,author,copyright,robots".split(","),function(e){for(var t,n=s.getAll("meta"),l=o[e],i=0;i<n.length;i++)if((t=n[i]).attr("name")===e)return void(l?t.attr("content",l):t.remove());l&&((a=new m("meta",1)).attr("name",e),a.attr("content",l),a.shortEnded=!0,r(a))});var d={};p.each(s.getAll("link"),function(e){"stylesheet"===e.attr("rel")&&(d[e.attr("href")]=e)}),p.each(o.stylesheets,function(e){d[e]||((a=new m("link",1)).attr({rel:"stylesheet",text:"text/css",href:e}),a.shortEnded=!0,r(a)),delete d[e]}),p.each(d,function(e){e.remove()}),(a=s.getAll("body")[0])&&(n(a,"dir",o.langdir),n(a,"style",o.style),n(a,"vlink",o.visited_color),n(a,"link",o.link_color),n(a,"alink",o.active_color),c.setAttribs(e.getBody(),{style:o.style,dir:o.dir,vLink:o.visited_color,link:o.link_color,aLink:o.active_color})),(a=s.getAll("html")[0])&&(n(a,"lang",o.langcode),n(a,"xml:lang",o.langcode)),i.firstChild||i.remove();var u=f({validate:!1,indent:!0,indent_before:"head,html,body,meta,title,script,link,style",indent_after:"head,html,body,meta,title,script,link,style"}).serialize(s);return u.substring(0,u.indexOf("</body>"))}(l,p.extend(s,t),i.get());i.set(n),e.close()}})},_=p.each,b=function(e){return e.replace(/<\/?[A-Z]+/g,function(e){return e.toLowerCase()})},x=function(e,t,n,l){var i,o,r,a,c,s,d,u,m,f="",g=e.dom;l.selection||(a=e.getParam("protect"),c=l.content,p.each(a,function(e){c=c.replace(e,function(e){return"<!--mce:protected "+escape(e)+"-->"})}),r=c,"raw"===l.format&&t.get()||l.source_view&&y(e)||(0!==r.length||l.source_view||(r=p.trim(t.get())+"\n"+p.trim(r)+"\n"+p.trim(n.get())),-1!==(i=(r=r.replace(/<(\/?)BODY/gi,"<$1body")).indexOf("<body"))?(i=r.indexOf(">",i),t.set(b(r.substring(0,i+1))),-1===(o=r.indexOf("</body",i))&&(o=r.length),l.content=p.trim(r.substring(i+1,o)),n.set(b(r.substring(o)))):(t.set(k(e)),n.set("\n</body>\n</html>")),s=v(t.get()),_(s.getAll("style"),function(e){e.firstChild&&(f+=e.firstChild.value)}),(d=s.getAll("body")[0])&&g.setAttribs(e.getBody(),{style:d.attr("style")||"",dir:d.attr("dir")||"",vLink:d.attr("vlink")||"",link:d.attr("link")||"",aLink:d.attr("alink")||""}),g.remove("fullpage_styles"),u=e.getDoc().getElementsByTagName("head")[0],f&&g.add(u,"style",{id:"fullpage_styles"}).appendChild(document.createTextNode(f)),m={},p.each(u.getElementsByTagName("link"),function(e){"stylesheet"===e.rel&&e.getAttribute("data-mce-fullpage")&&(m[e.href]=e)}),p.each(s.getAll("link"),function(e){var t=e.attr("href");if(!t)return!0;m[t]||"stylesheet"!==e.attr("rel")||g.add(u,"link",{rel:"stylesheet",text:"text/css",href:t,"data-mce-fullpage":"1"}),delete m[t]}),p.each(m,function(e){e.parentNode.removeChild(e)})))},k=function(e){var t,n="",l="";return e.getParam("fullpage_default_xml_pi")&&(n+='<?xml version="1.0" encoding="'+(i(e)||"ISO-8859-1")+'" ?>\n'),n+=e.getParam("fullpage_default_doctype","<!DOCTYPE html>"),n+="\n<html>\n<head>\n",(t=e.getParam("fullpage_default_title"))&&(n+="<title>"+t+"</title>\n"),(t=i(e))&&(n+='<meta http-equiv="Content-Type" content="text/html; charset='+t+'" />\n'),(t=g(e))&&(l+="font-family: "+t+";"),(t=h(e))&&(l+="font-size: "+t+";"),(t=e.getParam("fullpage_default_text_color"))&&(l+="color: "+t+";"),n+"</head>\n<body"+(l?' style="'+l+'"':"")+">\n"},C=function(e,t,n,l){l.selection||l.source_view&&y(e)||(l.content=(p.trim(t)+"\n"+p.trim(l.content)+"\n"+p.trim(n)).replace(/<!--mce:protected ([\s\S]*?)-->/g,function(e,t){return unescape(t)}))};e.add("fullpage",function(e){var t,n,l,i,o,r,a=s(""),c=s("");n=a,(t=e).addCommand("mceFullPageProperties",function(){d(t,n)}),(l=e).ui.registry.addButton("fullpage",{tooltip:"Metadata and document properties",icon:"document-properties",onAction:function(){l.execCommand("mceFullPageProperties")}}),l.ui.registry.addMenuItem("fullpage",{text:"Metadata and document properties",icon:"document-properties",onAction:function(){l.execCommand("mceFullPageProperties")}}),o=a,r=c,(i=e).on("BeforeSetContent",function(e){x(i,o,r,e)}),i.on("GetContent",function(e){C(i,o.get(),r.get(),e)})})}();