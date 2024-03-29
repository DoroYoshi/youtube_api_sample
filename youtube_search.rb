require 'google/apis/youtube_v3'

youtube = Google::Apis::YoutubeV3::YouTubeService.new
youtube.key = "AIzaSyATSsS1-BxWxarzkZ5T5rzZuyo_n2l0ubM"

text = ""
youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: "プログラミング", max_results: 10)

youtube_search_list.items.each do |item|
  channel_title = item.snippet.channel_title
  video_title = item.snippet.channel_title
  video_id = item.id.video_id
  
  text +=<<~EOS

  チャンネルタイトル:#{channel_title}
  タイトル:#{video_title}
  URL：https://www.youtube.com/watch?v=#{video_id}
  iframe：<iframe width="560" height="315" src="https://www.youtube.com/embed/#{video_id}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  EOS
end

puts text