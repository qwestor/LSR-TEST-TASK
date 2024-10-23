BX.ready(function () {
let customForm = BX("bx_custom_form");
BX.bind(customForm, "submit", BX.proxy(sendForm, this));
function sendForm(e) {
    let data = new FormData(customForm);
    BX.ajax({
    url: "/ajax/sendForm.php",
    data: data,
    method: "POST",
    dataType: "json",
    processData: false,
    preparePost: false,
    onsuccess: function (data) {
		const parsedData = JSON.parse(data);
		if(parsedData['error'] != "")
		{
			document.getElementById('result').innerHTML = '<span class="error">'+parsedData['error']+'</span>';
			console.log(parsedData['error']);
		}
		else{
			document.getElementById('result').innerHTML = '<span class="result">'+parsedData['result']+'</span>';
			document.bx_custom_form.reset();
			console.log(parsedData['result']);
		}
    },
    onfailure: function () {
        console.log("error");
    },
    });
    return BX.PreventDefault(e);
}
});