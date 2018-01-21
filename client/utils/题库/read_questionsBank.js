/*
//模板
"1","1","冰雪路面行驶时，与前车的安全距离是多少？","[{""right"": false, ""answer"": ""10米""}, {""right"": false, ""answer"": ""30米""}, {""right"": true, ""answer"": ""50米""}, {""right"": false, ""answer"": ""80米""}]"
"3","1","湖南省的简称","[{""right"": false, ""answer"": ""越""}, {""right"": false, ""answer"": ""赣""}, {""right"": false, ""answer"": ""闽""}, {""right"": true, ""answer"": ""湘""}]"
"4","1","株洲的车牌是什么？","[{""right"": false, ""answer"": ""A""}, {""right"": true, ""answer"": ""B""}, {""right"": false, ""answer"": ""C""}, {""right"": false, ""answer"": ""D""}]"
"6","1","不是长沙的区的是？","[{""right"": true, ""answer"": ""荷塘区""}, {""right"": false, ""answer"": ""雨花区""}, {""right"": false, ""answer"": ""芙蓉区""}, {""right"": false, ""answer"": ""天心区""}]"
"7","1","2017年的世界第一工业强国是？","[{""right"": false, ""answer"": ""美国""}, {""right"": false, ""answer"": ""德国""}, {""right"": true, ""answer"": ""中国""}, {""right"": false, ""answer"": ""日本""}]"
"8","1","下列哪个城市不属于湖南？","[{""right"": false, ""answer"": ""长沙""}, {""right"": false, ""answer"": ""株洲""}, {""right"": false, ""answer"": ""永州""}, {""right"": true, ""answer"": ""澳门""}]"

//不能转换的地方用替换的方式实现模板所示的格式
//导入时注意勾选忽略错误
*/
const fs = require("fs");
fs.readFile('questionBank.csv', function (err, data) {
    data = data.toString();
    let rows = data.split("\r\n");
    var writerStream = fs.createWriteStream('output.csv');
    for (var i = 0; i < rows.length; i++) {
		console.log('当前是第'+(i+1)+'行')
        let row0 = rows[i].split("|") //[ '3', '湖南省的简称', '粤', '皖', '赣', '湘', '4' ]
        let answer = [{
            "right": false,
            "answer": row0[2]
        }, {
            "right": false,
            "answer": row0[3]
        }, {
            "right": false,
            "answer": row0[4]
        }, {
            "right": false,
            "answer": row0[5]
        }]
        answer[row0[6]- 1]['right'] = true
        let row1 = [(i+1),row0[0], row0[1], JSON.stringify(answer)]
		let row_string=row1.join("','")
		console.log(row_string)
		// 使用 utf8 编码写入数据
		writerStream.write("'"+row_string+"'\r\n",'UTF8');
		
    }
	// 标记文件末尾
	writerStream.end();
});
