function validateForm() {
    var fileInput = document.getElementById('fileInput');
    var maxFileSize = 1000000;
    /*var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];*/

    if (fileInput.files.length > 0) {
        var file = fileInput.files[0];
        if (file.size > maxFileSize) {
            alert('File size exceeds the limit of 1MB.');
            return false;
        }
        /*if (!allowedTypes.includes(file.type)) {
            alert('Invalid file type. Allowed types: JPG, JPEG, PNG, GIF.');
            return false;
        }*/
    }

    return true;
}
