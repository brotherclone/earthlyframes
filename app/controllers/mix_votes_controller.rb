class MixVotesController < ApplicationController
  def new
    @mix_vote = MixVote.new
    # Placeholder: 12 songs, each with 2 mixes (replace with real data later)
    @songs = (1..12).map do |i|
      {
        id: "song#{i}",
        title: "Song #{i}",
        mixes: [
          { id: "song#{i}_mix1", name: "Mix 1", soundcloud_url: "https://soundcloud.com/example/song#{i}_mix1" },
          { id: "song#{i}_mix2", name: "Mix 2", soundcloud_url: "https://soundcloud.com/example/song#{i}_mix2" }
        ]
      }
    end
    @covers = [
      { id: 'cover1', image_url: '/assets/cover1.jpg' },
      { id: 'cover2', image_url: '/assets/cover2.jpg' },
      { id: 'cover3', image_url: '/assets/cover3.jpg' },
      { id: 'cover4', image_url: '/assets/cover4.jpg' }
    ]
  end

  def create
    @mix_vote = MixVote.new(mix_vote_params)
    if @mix_vote.save
      redirect_to new_mix_vote_path, notice: 'Thank you for your feedback!'
    else
      # Rebuild songs and covers for re-render
      @songs = (1..12).map do |i|
        {
          id: "song#{i}",
          title: "Song #{i}",
          mixes: [
            { id: "song#{i}_mix1", name: "Mix 1", soundcloud_url: "https://soundcloud.com/example/song#{i}_mix1" },
            { id: "song#{i}_mix2", name: "Mix 2", soundcloud_url: "https://soundcloud.com/example/song#{i}_mix2" }
          ]
        }
      end
      @covers = [
        { id: 'cover1', image_url: '/assets/cover1.jpg' },
        { id: 'cover2', image_url: '/assets/cover2.jpg' },
        { id: 'cover3', image_url: '/assets/cover3.jpg' },
        { id: 'cover4', image_url: '/assets/cover4.jpg' }
      ]
      render :new
    end
  end

  private

  def mix_vote_params
    params.require(:mix_vote).permit(:email, :comments, :selected_cover, mix_selections: {})
  end
end

