//= require active_admin/base
//= require tinymce

$(document).ready(function() {
    tinymce.init({
        selector: 'textarea',
        height: 600,
        plugins: 'codesample',
        toolbar: 'codesample',
        codesample_global_prismjs: true
    })
});

