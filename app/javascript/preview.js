document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');
    const THUMBNAIL_MAX_WIDTH = 500;
    const THUMBNAIL_MAX_HEIGHT = 500;

    //選択した画像を表示する関数
    const createImageHTML = (blob) => {
      //画像を表示する為のdiv要素生成
      const imageElement = document.createElement('div');
      //表示する画像の生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      //生成したHTMLの要素をブラウザへ表示
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      //画像が表示されている場合は、既にある画像を削除
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});