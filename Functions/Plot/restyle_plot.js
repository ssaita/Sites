//---------------------------------------------------------------------------
//　XYZFグラフを更新する。
//　引数：サーバーからのメッセージ　　返り値：なし
//---------------------------------------------------------------------------
function RePlot_XYZF(reData)
{
	const DATA = SetXFromDate12(reData);	// 日付を設定する

	// 更新用のオブジェクトを用意する
	let upDate = {
		x : [],
		y : [],
	};

	// トレースをコピー
	// let upDate = $.extend(true, [], DATA_XYZF);

	// データをupDateに入れる
	// for ( let i=0; i<DATA.Result.Y.length; i++){
	// 	upDate.x.push(DATA.Result.X);
	// }
	// upDate.y = DATA.Result.Y;
	for ( let i=0; i<4; i++ ){
		upDate.x.push(DATA.Result.X);
		upDate.y.push(DATA.Result.Y[i+1]);
	}

	// 更新する
	Plotly.restyle('XYZF',upDate);

}



//---------------------------------------------------------------------------
//　欠損マップを更新する。
//　引数：サーバーからのメッセージ　　返り値：なし
//---------------------------------------------------------------------------
function RePlot_Kesson(reData)
{
	// 更新用のオブジェクトを用意する
	let upDate = {
		x : [],
		z : [],
	};
console.log(reData)
	// データをupDateに入れる
	upDate.x.push( reData.Kesson.Date );
	upDate.z.push( ReverseArray(reData.Kesson.Z) );

	// 更新する
	Plotly.restyle('KESSON', upDate);
}
