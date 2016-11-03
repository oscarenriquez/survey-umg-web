function validaCarnet(ev) {
    var value = ev.target.value;
    var pattern = /[0-9]{2,4}-[0-9]{2}-[0-9]{2,8}/;
    if (value) {
        if (!pattern.test(value)) {
            
        }
    }
}