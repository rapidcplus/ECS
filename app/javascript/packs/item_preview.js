document.addEventListener('DOMContentLoaded', function () {
    const itemUrlInput = document.querySelector('#item_url'); // item_urlのinputフィールドを特定する
    const previewContainer = document.getElementById('preview'); // プレビューを表示するコンテナを特定する
  
    itemUrlInput.addEventListener('input', function () {
      console.log('イベント発火');
  
      const url = this.value;
      // YouTube ShortのURLからIDを抽出（パラメータ含む）
      const videoId = url.includes('youtube.com/shorts/') ? url.split('youtube.com/shorts/')[1] : null;
  
      // videoIdが取得できた場合、アスペクト比16:9の動画プレビューを表示
      if (videoId) {
        previewContainer.innerHTML = `
          <iframe width="360" height="640" src="https://www.youtube.com/embed/${videoId.split('?')[0]}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        `;
      } else {
        // YouTube Short以外のURLが入力された場合、何も表示しないまたはエラーメッセージを表示
        previewContainer.innerHTML = '<p>YouTube ShortのURLを入力してください。</p>';
      }
    });
  });
