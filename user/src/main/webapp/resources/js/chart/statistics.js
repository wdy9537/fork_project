let chart;
let chartDataLabels = [];
let chartDataDatasets = [];

const startDay = document.getElementById("start-day");
const endDay = document.getElementById("end-day");
const today = new Date();
const oneWeekBefore = new Date(new Date().setDate(today.getDate() - 7));
const chartArea = document.getElementById('chart-area');
const typeArea = document.querySelector(".choice-type-title");

startDay.value = daySetting(oneWeekBefore);
endDay.value = daySetting(today);

drawChart(); // 페이지 로딩과 동시에 차트 불러오기

startDay.addEventListener('change', changeDate); // 시작일 변경시 차트 재로드
endDay.addEventListener('change', changeDate); // 종료일 변경시 차트 재로드


function daySetting(day){ // 날짜 세팅 함수
	const year = day.getFullYear();
	const month = day.getMonth()+1;
	const date = day.getDate();
	
	return year+"-"+zeroSetting(month)+"-"+zeroSetting(date);
}

function changeDate(key){
    let changeStartDay;
    let changeEndDay;

    if ( key == 'yesterday' ) {
        changeStartDay = new Date(new Date().setDate(today.getDate() - 1));
        changeEndDay = today;
    } else if ( key == 'curretnMonth' ) {
        changeStartDay = new Date(new Date().setDate(1));
        changeEndDay = today;
    } else if ( key == 'previousMonth' ) {
        changeStartDay = new Date(new Date().setMonth(today.getMonth() - 1))
        changeEndDay = today;
    } else {
    	changeStartDay = new Date(startDay.value);
    	changeEndDay = new Date(endDay.value);
    };
    
    startDay.value = daySetting(changeStartDay);
    endDay.value = daySetting(changeEndDay);
    
    chartDataLabels = [];
	chartDataDatasets = [];
	chart.destroy();
	
	if ( typeArea.innerText === '매출통계') {
		drawChart();
	} else if ( typeArea.innerText === '메뉴통계' ) {
		drawMenuChart();
	}
}

function zeroSetting(num){
    return num < 10 ? '0' + (num) : num;
}

function changeType(key){
	chartDataLabels = [];
	chartDataDatasets = [];
	chart.destroy();
	
    if ( key === '메뉴' ) {
    	drawMenuChart();
    } if ( key === '매출' ) {
    	drawChart();
    }
    
    typeArea.innerText = key+"통계";
}



function drawChart(){
	$.ajax({
		url: 'chart',
		data: {startDay: startDay.value, endDay: endDay.value},
		success(list){
			for(l of list){
				chartDataLabels.push(l.payDate);
				chartDataDatasets.push(l.price);
			}
			loadChart();
		}
	})
}

function loadChart(){
	$(".statistics-content").removeClass("menu-chart").html(`<div id="chart-outer"><canvas id="chart-area" height="100%" /></div>`);
	
	const chartData = {
		labels: chartDataLabels,
	        datasets: [
	            { //데이터
	                label: '매출통계',
	                fill: false,
	                data: chartDataDatasets,
	                backgroundColor: ["rgba(255, 203, 133, 0.8)"], 
	                borderColor: 'orange',
	                borderWidth: 2 
	            }
	        ]
	}
	
	chart = new Chart($("#chart-area"), {
	    type: 'bar',
		  data: chartData,
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      }
		    }
		  }
	});
	
}

function drawMenuChart(){
	$(".statistics-content").html("");
	//$(".statistics-content").css({"display": "flex", "flex-wrap": "wrap", "justify-content": "flex-start"})
	$(".statistics-content").addClass("menu-chart");

	$.ajax({
		url: 'selectPrCategory',
		success(categorylist){
			for(prCate of categorylist) {
					let prNo= prCate.categoryNo;
					console.log(categorylist);
					console.log(prNo);
					$.ajax({
						url: 'menuChart',
						data: {startDay: startDay.value, endDay: endDay.value, prCateNo: prNo},
						async: false,
						success(menulist){
						
						console.log(menulist);
						
						chartDataLabels=[];
						chartDataDatasets=[];

						if ( menulist.length > 0 ) {

							$(".statistics-content").append(`<div id="chart-outer" style="position: relative; width: 33%; height: 33%">
							<div class="chart-category-title">${prCate.categoryName}</div>
						<canvas id="chart-area${prCate.categoryNo}" />
					</div>`);

							for(menuChart of menulist){
								chartDataLabels.push(menuChart.menuName);
								chartDataDatasets.push(menuChart.count);
							}
	
							loadMenuChart(prNo);
						}
						
					}
				})
				
			}
		}
	})
}


function loadMenuChart(areaNo){
	const labels = chartDataLabels;
	let randomBackgroundColor = ['#F6FF99','#CCD4FF','#C2FFFA','#FF8B80','#949EFF','#D980FF','#C480FF','#CCFFE6','#C2FFD5','#FFD1C7','#D8A8FF','#FFCE9E','#FFD7C7','#B8E9FF'];
	let chartArea = document.getElementById('chart-area'+areaNo);
	
	if ( randomBackgroundColor.length < labels.length ) {
		for ( i=0 ; i < labels.length; i++ ) {
			randomBackgroundColor.push("#"+Math.round(Math.random() * 0xffffff).toString(16));
		}
	}
	
	chart = new Chart(chartArea, {
		type: 'doughnut',
		data: {
	        	labels: labels,
			    datasets: [
			        {	
			            data: chartDataDatasets,
			            backgroundColor: randomBackgroundColor,
			            datalabels: {
			            	color: 'black',
			            	font: {size: 14},
			            },
			        }
			    ]
	    	},
	    plugins: [ChartDataLabels],
	    options: {
			responsive: true,
		    plugins: {
				legend: false,
		    	datalabels: { // datalables 플러그인 세팅
		    		align: 'top',
		    		formatter: function(value, context) {
		    			var idx = context.dataIndex;
		    			return context.chart.data.labels[idx];
		    		}
		    	}
		    }
		    
		  }
	})
}
	
	



