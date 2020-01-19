var amount = 1;

function init () {    
    sell_price = document.form.sell_price.value;  
    amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
    sell_price = document.form.sell_price.value;  
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;
    sum.value = parseInt(hm.value) * sell_price;   
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 0) {
			hm.value -- ;
            sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value < 0) {
			hm.value = 0;
		}
    sum.value = parseInt(hm.value) * sell_price;
}  