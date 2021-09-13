/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.9.2 (2021-09-08)
 */
!function(){"use strict";function o(e){return e.getParam("save_enablewhendirty",!0)}function a(e,n){e.notificationManager.open({text:n,type:"error"})}function t(t){t.addCommand("mceSave",function(){!function(e){var n=c.DOM.getParent(e.id,"form");if(!o(e)||e.isDirty()){if(e.save(),e.getParam("save_onsavecallback"))return e.execCallback("save_onsavecallback",e),e.nodeChanged();n?(e.setDirty(!1),n.onsubmit&&!n.onsubmit()||("function"==typeof n.submit?n.submit():a(e,"Error: Form submit field collision.")),e.nodeChanged()):a(e,"Error: No form element found.")}}(t)}),t.addCommand("mceCancel",function(){var e=t,n=r.trim(e.startContent);e.getParam("save_oncancelcallback")?e.execCallback("save_oncancelcallback",e):e.resetContent(n)})}function i(t){return function(e){function n(){e.setDisabled(o(t)&&!t.isDirty())}return n(),t.on("NodeChange dirty",n),function(){return t.off("NodeChange dirty",n)}}}var e=tinymce.util.Tools.resolve("tinymce.PluginManager"),c=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),r=tinymce.util.Tools.resolve("tinymce.util.Tools");e.add("save",function(e){var n;(n=e).ui.registry.addButton("save",{icon:"save",tooltip:"Save",disabled:!0,onAction:function(){return n.execCommand("mceSave")},onSetup:i(n)}),n.ui.registry.addButton("cancel",{icon:"cancel",tooltip:"Cancel",disabled:!0,onAction:function(){return n.execCommand("mceCancel")},onSetup:i(n)}),n.addShortcut("Meta+S","","mceSave"),t(e)})}();
