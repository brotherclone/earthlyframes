//= require active_admin/base
//= require tinymce

$(document).ready(function() {
    tinymce.init({
        selector: 'textarea',
        height: 600,
        plugins: 'link',
        menubar: 'insert',
        toolbar: ['undo redo | styleselect | bold italic | link | alignleft aligncenter alignright']
    })
});

