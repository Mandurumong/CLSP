	var ctx = document.getElementById('Chart20');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['2017', '2018', '2019', '2020', '2021'],
			datasets: [{
				label: '유병자 수',
				data: [18783, 22049, 25079, 27469, 32411],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	
	var ctx2 = document.getElementById('Chart_gender20');
	var lineChart = new Chart(ctx2, {
		type : 'line',
		data:{
			labels:['2017', '2018', '2019', '2020', '2021'],
			datasets:[
				{
					label: '남성',
					data: [10964, 12885, 14682, 16007, 18495],
					backgroundColor: 'rgba(54, 162, 235, 1)',
					borderColor: 'rgba(54, 162, 235, 1)',
					fill: false,
				},
				{
					label:'여성',
					data:[7819, 9164, 10397, 11462, 13916],
					backgroundColor : 'rgba(255, 99, 132, 1)',
					borderColor : 'rgba(255, 99, 132, 1)',
					fill: false,
				}
			],
			},
			options: {
				responsive: false,
				plugins: {
					position:'top',
				},
				title: {
					display: true,
					text: '2017년 부터 2021년 까지 성별 별 유병환자 수'
				},
				tooltips: {
					mode : 'index',
					interesct: false,
				},
				hover : {
					mode: 'nearest',
					intersect : true
				},
				scales: {
					xAxes:[{
						display: true,
						scaleLable:{
							display: true,
							labelString: '년도'
						}
					}],
					yAxes: [{
						display : true,
						ticks: {
							suggestedMin: 0,
						},
						scaleLabel: {
							display: true,
							labelString: '유병 환자 수 '
						}
					}]
				}
			}
		
	});
