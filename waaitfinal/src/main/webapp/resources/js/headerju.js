/**
 * 
 */
/* 채팅방 열기 */
 const chattingOpen=()=>{
		
		window.open(path+"/chat/open.do","chatting","top=100, left=200, height=700, width=550");
	}
	
/* 조직도 */
document.addEventListener("DOMContentLoaded", function () {
    fetch(path + '/api/nodeData')
        .then(response => response.json())
        .then(data => {
        	console.log(data);
        	
            var chart = new OrgChart(document.getElementById("tree"), {
            	nodeBinding: {
                    field_0: "name"
                },
                nodes: data
            });
        })
        .catch(error => console.error('Error fetching org chart data:', error));
});
 