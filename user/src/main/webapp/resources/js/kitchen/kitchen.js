$(document).ready(function() {
const notificationSound = document.getElementById('notificationSound');

sMenu();	

// socket
let socket = null;
socketst();

});

function sMenu(){
	let orderList = document.querySelectorAll('.order-page');
	
	orderList.forEach( (order) => {
	    const list = order.lastElementChild.children;
	    let cnt = 0;
	
	    for( let value of list ){
	        value.addEventListener('click',function(){
	            if ( this.style.textDecoration != 'line-through' ) cnt++;
	            this.style.textDecoration = 'line-through';
	
	            if (cnt==list.length) {
	                order.remove();
	            }
	        })
	    }
	})
}

function socketst() {
	let sock = new SockJS("http://192.168.30.14:8083/kiosk/user");
	let client = Stomp.over(sock);
	socket = client;
	
	client.connect({}, function() {
		console.log("Connected stompTest!");
		
		client.subscribe('/kiosk', function(event){

		const data = JSON.parse(event.body); // JSON 형식의 문자열을 파싱하여 객체로 변환
	    let rlist = data.receiptNoList;
	    
		$.ajax({
			url : "kitchen/newOrder/"+data.kioskNo,
			data : { receiptNoList : rlist },
			type : "POST",
			success(newOrder) {
				if ( newOrder.menuOption.length > 0 ) {
					let orderPage = "";
					let orderList = "";
					
					for(menu of newOrder.menuOption) {
					let optionName = "";
					
						if ( menu.optionName != null ) {
							optionName = "( " + menu.optionName + " )" 
						}
					
						orderList += `<li>${menu.cnt} x ${menu.menuName} ${optionName}</li>`
					}
					
					orderPage = `<div class="order-page">
									<div class="order-page-top">${newOrder.strucTitle} ${newOrder.payDate}</div>
									<div class="order-page-content">
										${orderList}
									</div>
								</div>`
					$(".outer").children().first().before(orderPage);
					
					notificationSound.play();
					sMenu();
				}
		
			} 
		});
			
		});
		
	});
}