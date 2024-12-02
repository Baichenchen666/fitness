<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
            	<h1 class="page-header">统计分析</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						健身教练受欢迎度
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                    			<div id="coach_div" style="height: 450px;width: 100%; margin:auto auto;">
							
								</div>
                    		</div>
                            <!-- /.col-lg-6 (nested) -->
						</div>
                        <!-- /.row (nested) -->
					</div>
                    <!-- /.panel-body -->
				</div>
                <!-- /.panel -->
			</div>
            <!-- /.col-lg-12 -->
		</div>
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						热门视频
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                    			<div id="video_div" style="height: 450px;width: 100%; margin:auto auto;">
							
								</div>
                    		</div>
                            <!-- /.col-lg-6 (nested) -->
						</div>
                        <!-- /.row (nested) -->
					</div>
                    <!-- /.panel-body -->
				</div>
                <!-- /.panel -->
			</div>
            <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
</div>
</body>
</html>
<script src="/static/hou/echarts/echarts.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	mychar();
	mychar1();
})

function mychar() {
	
	var myChart = echarts.init(document.getElementById('coach_div'));

	var colors = ['#99CCFF'];

	option = {
	    color: colors,

	    tooltip : {
            trigger: 'axis',
            formatter: "{b} : {c}"
        },
        
        grid: {show:'true',borderWidth:'0'},

        calculable : false,
        
	    legend: {
	        data: ['受欢迎度']
	    },
	    xAxis: [
	        {
	        	type : 'category',
                axisLabel : {
                    formatter: '{value}',
                },

                splitLine:{
                    lineStyle:{
                        width:0,
                        type:'solid'
                    }
                     
                },
                data : []
	        }
	    ],
	    yAxis: [
	        {
	            type : 'value',
	            name: '受欢迎度',
	            axisLine : {onZero: false},
                axisLabel : {
                    formatter: '{value}人',
                },
                splitLine:{
                    lineStyle:{
                        width:0,
                        type:'solid'
                    }
                },
	        }
	    ],
	    series: [
	        {
		        name:'受欢迎度',
		        type:'bar',
                smooth:true,
                barWidth : 40,
                data:[]
	        }
	    ]
	};
	dataLoading(option);
	myChart.setOption(option);
    window.addEventListener('resize', function () {myChart.resize();})
}

function dataLoading(option) {
	var list = eval("("+'${coachlist}'+")");
	console.log(list);
	var xAxisData = [];
	var seriesData = [];
	for(var i=0; i<list.length; i++) {
		xAxisData.push(list[i]['name']);
		seriesData.push(list[i]['num']);
	}
	option.xAxis[0].data = xAxisData;
	option.series[0].data = seriesData;1
}

function mychar1() {
	
	var myChart = echarts.init(document.getElementById('video_div'));

	var colors = ['#FFCCCC'];

	option = {
	    color: colors,

	    tooltip : {
            trigger: 'axis',
            formatter: "{b} : {c}"
        },
        
        grid: {show:'true',borderWidth:'0'},

        calculable : false,
        
	    legend: {
	        data: ['观看人数']
	    },
	    xAxis: [
	        {
	        	type : 'category',
                axisLabel : {
                    formatter: '{value}',
                },

                splitLine:{
                    lineStyle:{
                        width:0,
                        type:'solid'
                    }
                     
                },
                data : []
	        }
	    ],
	    yAxis: [
	        {
	            type : 'value',
	            name: '观看人数',
	            axisLine : {onZero: false},
                axisLabel : {
                    formatter: '{value}人',
                },
                splitLine:{
                    lineStyle:{
                        width:0,
                        type:'solid'
                    }
                },
	        }
	    ],
	    series: [
	        {
		        name:'观看人数',
		        type:'bar',
                smooth:true,
                barWidth : 40,
                data:[]
	        }
	    ]
	};
	dataLoading1(option);
	myChart.setOption(option);
    window.addEventListener('resize', function () {myChart.resize();})
}

function dataLoading1(option) {
	var list = eval("("+'${videolist}'+")");
	console.log(list);
	var xAxisData = [];
	var seriesData = [];
	for(var i=0; i<list.length; i++) {
		xAxisData.push(list[i]['title']);
		seriesData.push(list[i]['num']);
	}
	option.xAxis[0].data = xAxisData;
	option.series[0].data = seriesData;
}

</script>
</body>
</html>