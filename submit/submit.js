window.onload = function (){
	var comboData = [
		{index: 0, borough: 'Other/Non-specified'},
		{index: 1, borough: 'Cote-des-Neiges/Notre-Dame-de-Grace'},
		{index: 2, borough: 'Cote-St-Luc/Hampstead/Montreal Ouest'},
		{index: 3, borough: 'Lachine'},
		{index: 4, borough: 'Lasalle'},
		{index: 5, borough: 'Mont-Royal'},
		{index: 6, borough: 'Plateau-Mont-Royal'},
		{index: 7, borough: 'Sud-Ouest'},
		{index: 8, borough: 'Mercier/Hochelaga-Maisonneuve'},
		{index: 9, borough: 'Outremont'},
		{index: 10, borough: 'Rosemont/La Petite-Patrie'},
		{index: 11, borough: 'Saint-Laurent'},
		{index: 12, borough: 'Verdun'},
		{index: 13, borough: 'Ville-Marie'},
		{index: 14, borough: 'Villeray/Saint-Michel/Parc-Extension'},
		{index: 15, borough: 'Westmount'}
	];

	FancyForm.vtype({
		blankText: 'required'
	});

	var myForm = $('#form').FancyForm({
		theme: 'gray',
	  	width: 700,
	  	height: 440,
	  	inputWidth: 220,
	  	labelWidth: 100,
	  	url: 'http://localhost/tipster/api.php',
	  	method: 'POST',
	  	defaults: {
	  		type: 'string'
	  	},
	  	items: [{
	  		type: 'combo',
	  		label: 'Location',
	  		name: 'borough',
	  		data: comboData,
	  		displayKey: 'borough',
	  		valueKey: 'index',
	  		value: 0
	  	},{
	  		type: 'textarea',
	  		inputWidth: 660,
	  		height: 20,
	  		emptyText: 'Title',
	  		name: 'title',
	  		valid: {
	  			blank: false,
	  			blankText: 'Required'
	  		}
	    },{
	  		type: 'textarea',
	  		inputWidth: 660,
	  		height: 150,
	  		emptyText: 'Write Tip Here',
	  		label: false,
	  		name: 'tip',
	  		valid: {
	  			blank: false,
	  			blankText: 'Required'
	  		}
	  	},{
	  		type: 'radio',
	  		label: 'Category',
	  		name: 'category',
	  		value: 'other',
	  		items: [{
	  			text: 'Theft',
	  			value: 'theft'
	  		},{
	  			text: 'Scam',
	  			value: 'scam'
	  		},{
	  			text: 'Harassment',
	  			value: 'harassment'
	  		},{
	  			text: 'Break-In',
	  			value: 'breakin'
	  		},{
	  			text: 'Sexual Assault',
	  			value: 'sa'
	  		},{
	  			text: 'Physical Assault',
	  			value: 'pa'
	  		},{
	  			text: 'Other',
	  			value: 'other'
	  		}]
	  	}],
	  	buttons: [{
	  		text: 'Submit',
			handler: function(){
	  			document.write(escape('title'));
                		document.write(escape('tip'));
	  		},
	  		handler: function(){
	  			myForm.submit({
                params: {
                    method: 'submitPost',
                    title: myForm.get('title'),
                    body:myForm.get('tip'),
                    location_id: myForm.get('borough'),
                    tag_id: myForm.get('category'),

                },
                
                success: function(result, status, xhr){
                    alert(JSON.parse(result).result);
                    this.clear();
      
                },
                error: function(xhr,status,error){
                }
            });
	  			//this.clear();
	  		}
	  	}]
	});
}
