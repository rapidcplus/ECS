<script>
  document.addEventListener('DOMContentLoaded', function () {
    const itemUrlInput = document.querySelector('#item_url'); // item_urlのinputフィールドを特定する
    const previewContainer = document.getElementById('preview'); // プレビューを表示するコンテナを特定する

    itemUrlInput.addEventListener('input', function () {
      const url = this.value;
      const videoId = url.split('youtu.be/')[1]; // YouTubeのショートURLからIDを抽出

      if (videoId) {
        // iframeを使ってプレビューを表示
        previewContainer.innerHTML = `
          <iframe width="560" height="315" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        `;
      }
    });
  });
</script>
