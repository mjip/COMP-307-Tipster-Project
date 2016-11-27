window.onload = function(){    
    var myForm = $('#form').FancyForm({
        title: 'Admin Login',
        width: 330,
        height: 220,
        inputWidth: 200,
        labelWidth: 75,
        url: '',
        method: 'POST',
        defaults: {
            type: 'string'
        },
        items: [{
            label: 'Username',
            name: 'username'
        },{
            label: 'Password',
            name: 'password',
            type: 'password'
        }],
        buttons: [{
            text: 'Login',
            handler: function(){
                myForm.submit();
                this.clear();
            }
        }]
    });
};