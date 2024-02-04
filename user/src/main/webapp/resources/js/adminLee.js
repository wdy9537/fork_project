
$('.struc_table').click(function(e){
    $('#struc_detail').modal("show");
});

$("#clear-table").click(function () {
    const kioskNo = document.getElementById('kiosk-no').value; // 클릭 이벤트 핸들러 내에서 kioskNo를 가져옵니다.

    $.ajax({
        url : 'clearTable',
        data : { kioskNo: kioskNo }, // 클릭 이벤트 핸들러 내에서 정의한 kioskNo를 사용합니다.
        success(result){
            if (result > 0) {
                document.location.reload();
            }
        }
    });
    
    socket.send(`/user/send/claerTable/${kioskNo}`, {}, kioskNo); // 변수 이름을 kioskNo로 수정
});

$(document).ready(function() {
	socketst();
});

var socket = null;
var isStomp = false;

const notificationSound = document.getElementById('notificationSound');

function socketst() {
	var sock = new SockJS("http://192.168.30.14:8083/kiosk/user");
	var client = Stomp.over(sock);
	isStomp = true;
	socket = client;
	
	client.connect({}, function() {
		console.log("Connected stompTest!");
		
			
			client.subscribe('/kiosk', function(event){
				console.log(event);
				
				try {
				    const data = JSON.parse(event.body); // JSON 형식의 문자열을 파싱하여 객체로 변환
				    console.log(data.kioskNo); // kioskNo 값을 출력
				    let kno = data.kioskNo;
				    
				    
					if(data.price == null){
						
						$.ajax({
							url : "selectDetailMenu",
							data : {kioskNo : kno},
							success : function(result) {
							
							console.log(result);
							console.log(result[0].menuName);
							console.log(result[0].price);
							
								var html = "";
								var tprice = 0;
								for(let i = 0; i < result.length ; i++) {
								
									if ( i < 3 ) {
									
										html += `<div class="menu">
			                                        <div class="menu_title">${result[i].menuName}</div>
			                                        <div class="menu_cnt">${result[i].cnt}</div>
			                                    </div>`;
                                    }
		                                    
		                           	tprice += result[i].price;
								}
								
								$(`#kiosk${kno} > .menus`).html(html); 
								
								html = "";
								
								if ( result.length > 3 ) {
									html +=  `<div class="menu_more">…</div>`
								}
								html += `<div class="menu_price">
		                                	${tprice.toLocaleString()}원
		                            	 </div>`;
		                        
		                        console.log(html);
		                        
		                        $(`#kiosk${kno} > .menu_footer`).html(html); 
                        		$(`#kiosk${kno}`).addClass("in_menu");
							} 
						});
					} else if(data.price == 0) {
						
						const alertPage = document.createElement('div');
						alertPage.id = 'alertPage';
						alertPage.setAttribute('class','alertPage');
						alertPage.style.display = 'none';
						
						const alertPageContent = document.createElement('div');
						alertPageContent.setAttribute('class', 'alertPageContent');
						const info = document.createTextNode(`${data.kioskNo}번 테이블에서 호출하였습니다.`);
						const closebutton = document.createElement('button');
						closebutton.setAttribute('class','closebutton');
						closebutton.addEventListener('click', () => closeModal(alertPage));
						closebutton.innerText = "확인";
						alertPageContent.append(info , closebutton);
						alertPage.append(alertPageContent);
					
						$("body").append(alertPage);
						notificationSound.play();
						openModal(alertPage);
					} else {
						
						$.ajax({
							url : "selectDetailMenu",
							data : {kioskNo : kno},
							success : function(result) {
							
							console.log(result);
							console.log(result[0].menuName);
							console.log(result[0].price);
							
								var html = "";
								var tprice = 0;
								for(let i = 0; i < result.length ; i++) {
								
									if ( i < 3 ) {
									
										html += `<div class="menu">
			                                        <div class="menu_title">${result[i].menuName}</div>
			                                        <div class="menu_cnt">${result[i].cnt}</div>
			                                    </div>`;
                                    }
		                                    
		                           	tprice += result[i].price;
								}
								
								$(`#kiosk${kno} > .menus`).html(html); 
								
								html = "";
								
								if ( result.length > 3 ) {
									html +=  `<div class="menu_more">…</div>`
								}
								html += `<div class="menu_price">
		                                	${tprice.toLocaleString()}원
		                            	 </div>`;
		                        
		                        console.log(html);
		                        
		                        $(`#kiosk${kno} > .menu_footer`).html(html); 
                        		$(`#kiosk${kno}`).addClass("in_menu");
							} 
						});
						
						const alertPage = document.createElement('div');
						alertPage.id = 'alertPage';
						alertPage.setAttribute('class','alertPage');
						alertPage.style.display = 'none';
						
						const alertPageContent = document.createElement('div');
						alertPageContent.setAttribute('class', 'alertPageContent');
						const info = document.createTextNode(`${data.kioskNo}번 테이블 ${data.price}원 현금결제 요망.`);
						const closebutton = document.createElement('button');
						closebutton.setAttribute('class','closebutton');
						closebutton.addEventListener('click', () => closeModal(alertPage));
						closebutton.innerText = "확인";
						alertPageContent.append(info , closebutton);
						alertPage.append(alertPageContent);
						
						// data.kioskNo + '번 테이블 현금결제 요망. <button class="closebutton" onclick="closeModal()">확인</button>'
						$("body").append(alertPage);
						notificationSound.play();
						openModal(alertPage);
					}
				    
				  } catch (error) {
				    console.error('JSON 파싱 오류:', error);
				  }
				
			});
		
	
	});
}

// 모달창 기능
function openModal(alertPage) {
    alertPage.style.display = 'block';
}

function closeModal(alertPage) {
    alertPage.remove();
}

function detail_order(title, no){
    $.ajax({
        url : 'detailOrder',
        data : { kioskNo : no },
        success(order){
        	console.log(order);
            if ( order.length > 0 ) {
                let menu = "";
                for( i in order ) {
                    menu += `
                    <div class="detail_menu">
                   	    <div class="menu detail_menu_title">${order[i].menuName}</div>
                   	    <div class="menu detail_menu_option">${order[i].optionName == null ? ' ' : order[i].optionName}</div>
                        <div class="menu detail_menu_cnt">${order[i].cnt}</div>
                        <div class="menu detail_menu_price">${order[i].price.toLocaleString()}</div>
                    </div>`;
                }
                $("#kiosk-no").val(no);
                $("#struc-title").html(title);
                $("#total-price").html($(order.totalPrice));
                $(".modal-body").html(menu);
                $("#struc_detail").modal("show");
            }
        }
    })
}

function saveStructure(){
    $.ajax({
        url : 'deleteStructure',
        success(result){
            if ( result > 0 ) {
                insertStructure();
                alert("수정되었습니다");
                location.href='salesReady';
            }
        }
    })
    
    
}
    
function insertStructure(){
    const structure = document.querySelectorAll(".struc");
    let strucList = [];
    
    structure.forEach((struc) => {
        strucTitle = $(struc).find("#struc_name").val();
        kioskNo = $(struc).find("#kiosk_no").val();
        strucType = $(struc).find("#struc_type").val();
        
        const position = struc.style.transform;
    
        let positionX = position.substr(12);
        const xend = positionX.indexOf('px');
        positionX = positionX.substr(0, xend);
        
        let ystart = position.indexOf('px, ');
        let positionY = position.substr(ystart+4);
        const yend = positionY.indexOf('px');
        positionY = positionY.substr(0, yend);
        
        strucList.push({strucTitle, kioskNo, strucType, positionX, positionY});
    })
    
    $.ajax({
        url : "saveStructure",
        type : "POST",
        data : JSON.stringify(strucList),
        dataType: "json",
        contentType : 'application/json; charset=UTF-8'
    })
}

/*
$("#clear-table").click(function (){
    
    $.ajax({
        url : 'clearTable',
        data : { kioskNo : $(this).prev().val() }, 
        success(result){
            if ( result > 0 ) {
                document.location.reload();
            }
        }
    })
})
*/