window.onload = function(){    
    var myForm = $('#form').FancyForm({
        title: 'Admin Login',
        width: 330,
        height: 220,
        inputWidth: 200,
        labelWidth: 75,
        url: 'https://localhost/tipster/api.php',
        method: 'POST',
        defaults: {
            type: 'string'
        },
        items: [{
            label: 'Username',
            name: 'username',
            valid: {
	  			blank: false,
	  			blankText: 'Required'
	  		}
        },{
            label: 'Password',
            name: 'password',
            type: 'password'
        }],
        buttons: [{
            text: 'Login',
            handler: function(){
                myForm.submit({
                    params: {
                        method: 'login',
                        username: myForm.get('username'),
                        password: myForm.get('password'),
                    },
                    success: function(result, status, xhr){
                        console.log('success');
                        console.log(result);
                        obj = JSON.parse(result);
                        if (obj.result == 'OK') {
                            window.location = 'https://localhost/tipster/admin/admin.html';
                        }
                        else {
                            alert("Incorrect Login Info");
                            console.log('Incorrect Login Info');
                        }
                    },
                    error: function(xhr,status,error){
                        console.log('error');
                        console.log(arguments);
                    }
                });
                this.clear();
            }
        }]
    });
};