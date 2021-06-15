# frozen_string_literal: true

module BCDice
  module GameSystem
    class BeginningIdol < Base
      private

      WORK_TABLE = {
        "BWT" => DiceTable::D66Table.new(
          "大手芸能プロダクション仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "先輩アイドルが司会を務めるバラエティ番組に出演！　どんなコーナーを任されるんだろう？\n特技 : 趣味分野からランダム",
            13 => "先輩アイドルと街歩き番組で共演。この街には何があるんだろう？\n特技 : 出身分野からランダム",
            14 => "先輩アイドルが音楽番組に出演。バックダンサーを務めることに。\n特技 : 《ダンス／趣味9》",
            15 => "先輩アイドルと一緒にグラビア撮影。負けないように目立とう。\n特技 : 《マイペース／キャラ4》",
            16 => "アイドル紹介番組で、先輩アイドルから紹介される。元気にいこう。\n特技 : 《元気／キャラ8》",
            22 => "オフ",
            23 => "先輩アイドルのラジオ番組にゲスト出演。トークでうまく盛り上げられるかな？\n特技 : 《キャラ分野の空白／キャラ7》",
            24 => "同期アイドルたちと一緒に、大掛かりなアスレチックセットに挑戦！\n特技 : 《運動神経／才能8》",
            25 => "特別な衣装で行う演劇の仕事がやって来た。どんな衣装なんだろう？\n特技 : 属性分野からランダム",
            26 => "プロダクションの超大御所が出演する番組に呼ばれる。\n特技 : 《胆力／才能5》",
            33 => "オフ",
            34 => "シーンプレイヤーのキャラクターを活かしたミニドラマが制作される。\n特技 : シーンプレイヤーの修得しているキャラ分野の特技",
            35 => "海外ロケを行うプロダクション制作の旅番組に出演。今日はどこまで行くんだろうか？\n特技 : 《海外／出身12》",
            36 => "プロダクション内の劇場で、シーンプレイヤーの「好きなもの」を使った演劇が始まる。\n特技 : シーンプレイヤーの修得している趣味分野の特技",
            44 => "オフ",
            45 => "ファッションブランドと提携したファッションショーに招待される。\n特技 : 《おしゃれ／趣味5》",
            46 => "アイドル雑誌の出版社から取材がやってきた。うまく対応しよう。\n特技 : 《物腰丁寧／キャラ10》",
            55 => "オフ",
            56 => "シリーズもののドラマにちょっとした役で出演！\n特技 : 《演技力／才能12》",
            66 => "プロダクション内で総選挙が開始！　今回のテーマは……？\n特技 : ランダム",
          }
        ),
        "LWT" => DiceTable::D66Table.new(
          "弱小芸能プロダクション仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "パートナープレイヤーの「身体的特徴」にびびっと来たTV曲からオファーが来る。\n特技 : パートナープレイヤーが修得している身長分野の特技",
            13 => "スタントマンなしのアクションドラマが製作開始！　オーディションを受けることに。\n特技 : 《運動神経／才能8》",
            14 => "歌番組のオーディションに挑戦！　たくさんのライバルの中から、選ばれることを目指す！\n特技 : 《集中力／キャラ4》",
            15 => "飲み屋に営業へ。アイドルにあまり興味なさそうな客層だけど……。\n特技 : 《マイペース／キャラ4》",
            16 => "結婚式のパンフレット写真を撮ることに。花嫁さんってどんな気分だろう？\n特技 : 《スタイル／才能3》",
            22 => "オフ",
            23 => "CDデビューをかけて、バラエティ番組で他のアイドルと対決！\n特技 : キャラ分野からランダム",
            24 => "CDショップで、CDを手渡し販売。よろしくお願いします。\n特技 : 《元気／キャラ8》",
            25 => "ローカル番組に出演。この地方では、何が流行っているんだろう？\n特技 : 出身分野からランダム",
            26 => "劇の脇役を勝ち取るためにオーディションを受ける。平凡な女の子を演じるらしい。\n特技 : 《プレーン／属性7》",
            33 => "オフ",
            34 => "パートナープレイヤーの「好きなもの」が題材のドラマが製作中。オーディションを受けよう。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            35 => "パートナープレイヤーの「嫌いなもの」を題材にしたドラマにオファーが……。\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            36 => "コーラスに欠員が出たアイドルライブの穴埋めとして選ばれる。主役のキャラに合わせないと。\n特技 : 属性分野からランダム",
            44 => "オフ",
            45 => "PCたちの事務所にレポートのカメラが入る。小さいけどがんばってます！\n特技 : ランダム",
            46 => "オフ",
            55 => "オフ",
            56 => "オフ",
            66 => "オフ",
          }
        ),
        "TWT" => DiceTable::D66Table.new(
          "ライブシアター仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "シアター内でドラマを収録。テーマは、パートナープレイヤーの「好きなもの」だ。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            13 => "シアター内で売り出すCDを制作。テーマは、シーンプレイヤーの「好きなもの」だ。\n特技 : シーンプレイヤーが修得している趣味分野の特技",
            14 => "シアターの売店に駆り出される。直接お客さんと触れ合うチャンス！\n特技 : 《笑顔／才能7》",
            15 => "シアター内でグッズを販売。今の売れ線は何かな？\n特技 : キャラ分野からランダム",
            16 => "シアター内で握手会を開催！　来てくれたみんなに感謝を。\n特技 : 《気配り／才能9》",
            22 => "オフ",
            23 => "今回の劇、シーンプレイヤーの【背景】を元にしたノンフィクションドラマ！\n特技 : 趣味分野からランダム",
            24 => "シアターを使って、バラエティの企画が開始。みんなを笑わせよう。\n特技 : 《ばか／キャラ12》",
            25 => "シアターに流れるミニラジオの収録。メンバーに無茶ぶりをするコーナーが見せ場。\n特技 : キャラ分野からランダム",
            26 => "シアターにファッションデザイナーを招いてファッションショー。うまく魅せていこう。\n特技 : 属性分野からランダム",
            33 => "オフ",
            34 => "シアター企画、1D6時間耐久ダンスが始まる……！\n特技 : 《体力／才能6》",
            35 => "シアター企画、パートナープレイヤーは「嫌いなもの」に何回挑戦できるか！\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            36 => "シアター企画、シーンプレイヤー対「嫌いなもの」！\n特技 : シーンプレイヤーが修得しているキャラ分野の特技",
            44 => "オフ",
            45 => "シアター企画、非常に高いゴールを使ったバスケット！　……本当にできるの？\n特技 : 《190～／身長12》",
            46 => "シアター企画、動物と触れ合うアイドルの姿を中継！\n特技 : 《ペット／趣味3》",
            55 => "オフ",
            56 => "シアターの外で行う仕事をこなす。\n特技 : ランダム",
            66 => "オフ",
          }
        ),
        "CWT" => DiceTable::D66Table.new(
          "アイドル部仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "先生に頼まれて、入部希望者たちの校内案内を務めることになった。\n特技 : 《物腰丁寧／キャラ10》",
            13 => "校内イベントの司会進行をすることになった。うまく盛り上げられるかな？\n特技 : 《ポップ／属性9》",
            14 => "校内放送に出演。全校生徒の前でも、緊張しないようにしないと。\n特技 : 《胆力／才能5》",
            15 => "部活の大会に応援をしに行くことに。長い試合は、体力勝負だ。\n特技 : 《体力／才能6》",
            16 => "アイドル部を取材する記者がやって来た。うまく自分たちの言葉を語れるかな？\n特技 : 《気配り／才能9》",
            22 => "オフ",
            23 => "近くの幼稚園で歌を披露することになった。小さい子と目線を合わせないと……。\n特技 : 《～125／身長2》",
            24 => "メイド喫茶をすることになった。パートナープレイヤーの「好きなもの」が主なメニューだ。\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            25 => "校内のイベントを取材することになった。そこにはパートナープレイヤーの「嫌いなもの」が……。\n特技 : パートナープレイヤーが修得しているキャラ分野の特技",
            26 => "パートナープレイヤーの「ファッション特徴」を活かした、校内ファッションショー。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            33 => "オフ",
            34 => "地元の商店街からお店の手伝いを依頼される。町を盛り上げていこう。\n特技 : 《ショッピング／趣味8》",
            35 => "地元のイベントに出演。郷土愛が試される！\n特技 : プロデューサーが出身分野の特技から選ぶ",
            36 => "パートナープレイヤーの「身体的特徴」に惹かれた企業からオファーが来た！\n特技 : 《セクシー／属性4》",
            44 => "オフ",
            45 => "オフ",
            46 => "オフ",
            55 => "オフ",
            56 => "オフ",
            66 => "オフ",
          }
        ),
        "SU" => DiceTable::D66Table.new(
          "情熱の夏仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "飲料水のコマーシャル。美味しそうに飲もう。\n特技 : 《演技力／才能12》",
            13 => "夏のパレードのコマーシャル。今回のテーマは、パートナープレイヤーの「好きなもの」。\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            14 => "海水浴場のコマーシャル。見ている人に、元気をおすそ分けできればいいな。\n特技 : 《ポップ／属性9》",
            15 => "避暑地のコマーシャル。涼しいところで、ゆったりと過ごしているところをお届け。\n特技 : 《マイペース／キャラ4》",
            16 => "虫避け商品のコマーシャル。虫に立ち向かう男らしさを求められる。\n特技 : 《硬派／キャラ9》",
            22 => "オフ",
            23 => "水族館で元気なイルカたちとショーをする。\n特技 : 《元気／キャラ8》",
            24 => "少年野球の始球式を任される。球児たちに恥ずかしくないピッチングを魅せないと。\n特技 : 《スポーツ／趣味4》",
            25 => "夏のファッションを雑誌で発表することになった。この時期のコーデはこれ！\n特技 : 《おしゃれ／趣味5》",
            26 => "番組で夏野菜を美味しく食べる必要に迫られる。ゴーヤをアイドルらしく食べよう。\n特技 : 《沖縄／出身2》",
            33 => "オフ",
            34 => "ビーチバレーで敵のアイドルと対決だ！　夏の暑さに負けるな！\n特技 : 《バーニング／属性10》",
            35 => "ビーチで他のアイドルとナンパ対決をすることになった。どちらがうまくこなせるかな？\n特技 : 《軟派／キャラ5》",
            36 => "夏のグルメ特集！　夏バテ防止のためにも、たくさん食べるところを魅せなければ。\n特技 : 《料理／趣味6》",
            44 => "オフ",
            45 => "夏休みの子供たちと触れ合う番組に呼ばれる。子供たちの相手も大変だ。\n特技 : 《気配り／才能9》",
            46 => "夏の旅行番組。夏ならではの、地元の強みを伝えることに。\n特技 : シーンプレイヤーが修得している出身分野の特技",
            55 => "オフ",
            56 => "夏だからアツアツのお風呂に叩きこまれる。リアクションを撮りたいようだ。\n特技 : 《ばか／キャラ12》",
            66 => "オフ",
          }
        ),
        "WI" => DiceTable::D66Table.new(
          "ぬくもりの冬仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "クリスマスがテーマのコマーシャルソングを歌う。恋人たちに祝福を！\n特技 : 《パッション／属性8》",
            13 => "スキー場のコマーシャルムービーを撮ることに。うまく滑れるといいな。\n特技 : 《スポーツ／趣味4》",
            14 => "苦い失恋をテーマにしたコマーシャルムービーを撮ることになった。クールに決めよう。\n特技 : 《クール／属性11》",
            15 => "スケートリンクのコマーシャルムービーに出演。氷上で華麗にダンスを決めよう。\n特技 : 《ダンス／趣味9》",
            16 => "アイスのコマーシャルムービーに出演。寒いのを耐えろ！\n特技 : 《胆力／才能5》",
            22 => "オフ",
            23 => "年末年始に流れる鉄道のコマーシャルムービーに起用される。清潔感のある演技が必要だ。\n特技 : 《プレーン／属性7》",
            24 => "温泉地のコマーシャル。温泉に必要なのは、やっぱりセクシーさかな？\n特技 : 《セクシー／属性4》",
            25 => "冬ファッションを雑誌で紹介することになった。冬コーデはこれで決まり！\n特技 : 《おしゃれ／趣味5》",
            26 => "雪かきの大変さを伝えるために、東北で雪かきを手伝う。これは重労働だ。\n特技 : 《東北地方／出身10》",
            33 => "オフ",
            34 => "年末のバラエティ番組で、関西の芸人と一緒にコントをやることになった。ノリを合わせよう。\n特技 : 《近畿地方／出身6》",
            35 => "年末のフェスで、有名アイドルたちと共演！　スターに負けない迫力を出そう。\n特技 : 《スター／属性12》",
            36 => "冬の北海グルメを伝えるために、北海道に飛ぶ。果たして、寒さに耐えられるのか。\n特技 : 《北海道／出身11》",
            44 => "オフ",
            45 => "冬のグルメ特集。鍋の作り方を教えます。\n特技 : 《料理／趣味6》",
            46 => "バレンタインに向けて、女の子たちにアドバイス。\n特技 : 《フェミニン／属性5》",
            55 => "オフ",
            56 => "冬だからアツアツのお風呂に叩きこまれる。暖かいというか熱い！\n特技 : 《ばか／キャラ12》",
            66 => "オフ",
          }
        ),
        "NA" => DiceTable::D66Table.new(
          "大自然仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "渓流で釣り対決！　たくさん釣ったほうが勝ち！\n特技 : 《集中力／才能4》",
            13 => "海岸で釣りをすることに。釣った魚がおいしいほうが勝ち。\n特技 : 《胆力／才能5》",
            14 => "虫取りに挑戦。元気に戯れる図を撮りたいとのこと。\n特技 : 《元気／キャラ8》",
            15 => "キャンプを張ろう。みんな快適に寝泊りができるように、心配りが大事。\n特技 : 《気配り／才能9》",
            16 => "海で泳ぎの対決。自分のペースを守って、戦おう。\n特技 : 《マイペース／キャラ4》",
            22 => "オフ",
            23 => "森でナンパ対決！　……動物にモテた方が勝ち！\n特技 : 《ペット／趣味3》",
            24 => "森で鬼ごっこをすることになった。相手の動きを読めば勝てる！\n特技 : パートナープレイヤーが修得している身長分野の特技",
            25 => "森の奥で、動物との戦いが始まった。や、やるしかない。\n特技 : 《運動神経／才能8》",
            26 => "オフ",
            33 => "オフ",
            34 => "料理ができる男をここでアピール！　飯盒炊爨（はんごうすいさん）に挑戦！\n特技 : 《料理／趣味6》",
            35 => "山登り対決。早く登るよりも、怪我をしないように気をつけたい。\n特技 : 《体力／才能6》",
            36 => "薪拾い。地味な絵面になってしまうので、退屈をさせないように魅せよう。\n特技 : 《キャラ分野の空白／キャラ7》",
            44 => "オフ",
            45 => "視聴者が喜びそうなここだけの話をパートナープレイヤーにする。\n特技 : パートナープレイヤーが修得しているキャラ分野の特技",
            46 => "些細なことでパートナープレイヤーと喧嘩になる。どっちが強いか勝負だ！\n特技 : パートナープレイヤーが修得している才能分野の特技",
            55 => "オフ",
            56 => "ドラム缶風呂を用意することに。……熱いんだけど！\n特技 : 《バーニング／属性10》",
            66 => "オフ",
          }
        ),
        "GA" => DiceTable::D66Table.new(
          "聖デトワール女学園仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "学園が主催しているアイドル触れ合いイベントに出演。美しく振舞おう。\n特技 : 《スタイル／才能3》",
            23 => "学園のアイドルたちが出ているラジオに出演。先輩たちに負けないように、がんばろう。\n特技 : 《元気／キャラ8》",
            24 => "学園と提携しているブランドのファッションショーに登場。\n特技 : 《おしゃれ／趣味5》",
            25 => "学園を紹介するDVDに出演。うまく魅力を紹介できるかな？\n特技 : 《気配り／才能9》",
            26 => "学内オーディションに出場。勝ち抜けば、歌番組に出場できる！\n特技 : 《胆力／才能5》",
            33 => "学園が制作しているアイドルドラマに吸血鬼役で出演。恐ろし気な演技、できるかな？\n特技 : 《オカルト／趣味2》",
            34 => "学園が制作しているドラマに出演。演技の中で、どうやって個性を出していこうか。\n特技 : キャラ分野からランダム",
            35 => "学園主催のミニライブに出演。たくさんの出演者の中から、どうやって目立とう。\n特技 : キャラ分野からランダム",
            36 => "学園の先輩たちと共演するライブイベントに出演。\n特技 : 《胆力／才能5》",
            44 => "学園の紹介で、おいしい芋の紹介番組に出演。北海道に出発だ！\n特技 : 《北海道／出身11》",
            45 => "学内オーディションで、ポップなCMのイメージガールを決定。戦い抜こう。\n特技 : 《ポップ／属性9》",
            46 => "学内のミュージカルに出演することになった。自分たちの実力を舞台の上で発揮しよう。\n特技 : 《演技力／才能12》",
            55 => "市内の店舗を手伝うドキュメンタリー番組を撮ることに。お店を手伝おう。\n特技 : 《物腰丁寧／キャラ10》",
            56 => "市内のスタジオで収録されている朝の情報番組に出演。朝から元気に行こう。\n特技 : 《元気／キャラ8》",
            66 => "裏山を使った簡単なPV撮影！　山での撮影は体力が要求される。\n特技 : 《体力／才能6》",
          }
        ),
        "BA" => DiceTable::D66Table.new(
          "アカデミー仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "アカデミーの中でも、特に優秀な成績を収めた者を表彰する式が開催される。\n特技 : 《スター／属性12》",
            23 => "アカデミー主催の音楽祭に出演。楽器を演奏して、その姿で魅せよう。\n特技 : 《音楽／趣味11》",
            24 => "アカデミーが製作しているドラマに出演。脇役だけど、しっかりと存在感を出していこう。\n特技 : 《演技力／才能12》",
            25 => "番組の企画で、アカデミー生のアクションを見せることになった。\n特技 : 《運動神経／才能9》",
            26 => "番組の1コーナーで、アカデミー生が様々なスポーツに挑戦する必要があるらしい。がんばろう。\n特技 : 《スポーツ／趣味4》",
            33 => "先輩と一緒にバラエティ番組に出演。面白いリアクションを期待される。\n特技 : 《ばか／キャラ10》",
            34 => "先輩のライブでバックコーラスに参加。美しい声を添えよう。\n特技 : 《音楽／趣味11》",
            35 => "先輩のライブでバックダンサーとして出演。ダイナミックな演出に負けないようにしよう。\n特技 : 《ダンス／趣味9》",
            36 => "先輩が主演を務めているアニメ映画に脇役の声優として出演。光る演技を見せよう。\n特技 : 《演技力／才能12》",
            44 => "同級生と一緒に、漫画作品をモデルにしたミュージカルに出演。熱い気合を求められる。\n特技 : 《バーニング／属性10》",
            45 => "同級生と一緒にキャラ付けの強いビジュアル系バンドを組んで、試験のステージで発表。\n特技 : キャラ分野からランダム",
            46 => "同級生とファッションを競い合う、セルフプロデュース試験が始まる。\n特技 : 《おしゃれ／趣味5》",
            55 => "一般教養の試験が始まる。恐ろしいことに、その様子を生中継するらしい。\n特技 : 《学力／才能10》",
            56 => "アイドルの歴史を使った、クイズ試験が始まる。\n特技 : 《アイドル／趣味12》",
            66 => "試験のテーマは耽美。セクシーさを仲間と競い合おう。\n特技 : 《セクシー／属性4》",
          }
        ),
        "WT" => DiceTable::D66Table.new(
          "仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "握手会が始まる。アイドルとして重要な場面、集中していこう。\n特技 : 《アイドル／趣味12》",
            13 => "パートナープレイヤーの「嫌いなもの」に取材をすることになった。大丈夫かな……？\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            14 => "シーンプレイヤーの「好きなもの」に関する番組の仕事だ！　テンション上がるー！\n特技 : シーンプレイヤーが修得している趣味分野の特技",
            15 => "パートナープレイヤーの「ファッション特徴」を活かす仕事がやって来た。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            16 => "クライアントから、もっとパートナープレイヤーの「個性特技」を推していこうよ、と提案を受ける。\n特技 : パートナープレイヤーの個性特技",
            22 => "オフ",
            23 => "学園ドラマを撮影！　二人のキャラ付けはどうなるのかな？\n特技 : キャラ分野からランダム",
            24 => "ドラマのアクションシーンを撮ることに。コンビネーションで切り抜けよう。\n特技 : 身長分野からランダム",
            25 => "感動系のドラマに出演。どんな能力が必要になるかな？\n特技 : 才能分野からランダム",
            26 => "趣味の番組に出演。こんな世界があるのか……。\n特技 : 趣味分野からランダム",
            33 => "オフ",
            34 => "アイドルだらけのバラエティ番組に参戦！　どのアイドルよりも高い点数を取るといいらしい！\n特技 : 《ばか／キャラ12》",
            35 => "スポーツ番組の賑やかしとして呼ばれた！　スポーツのこと、わかりますか？\n特技 : 《スポーツ／趣味4》",
            36 => "クイズ番組に二人でゲスト出演。力を合わせて勝ち抜くか、それとも自分らしさを重視するか……。\n特技 : 《学力／才能10》",
            44 => "オフ",
            45 => "料理番組に出演。どんな料理を作ろうかな。\n特技 : 《料理／趣味8》",
            46 => "CDショップでサイン会を開催。ファンを喜ばせることができるかな？\n特技 : 《気配り／才能9》",
            55 => "オフ",
            56 => "二人にグラビア撮影の仕事が来た。スタイルのよさを魅せるチャンス？\n特技 : 《スタイル／才能3》",
            66 => "オフ",
          }
        ),
        "VA" => DiceTable::D66Table.new(
          "バラエティ仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "食べたものをリポートする番組に出演。どうすれば味を言葉で表現できるだろうか？\n特技 : 《料理／趣味6》",
            13 => "スポーツする番組に出演。どれだけ活躍できるかが試される。\n特技 : 《スポーツ／趣味4》",
            14 => "トーク番組に出演。二人の喋りをうまく魅せなければ。\n特技 : 《気配り／才能9》",
            15 => "猛獣の檻に入って、ボール遊びをすることに。度胸が肝心！\n特技 : 《胆力／才能5》",
            16 => "パートナープレイヤーの「好きなもの」を題材にした番組コーナーを任された。\n特技 : パートナープレイヤーの修得している趣味分野の特技",
            22 => "オフ",
            23 => "街歩き番組に出演。軽快なトークで、素人の人たちからうまい言葉を引き出そう。\n特技 : 《軟派／キャラ5》",
            24 => "釣り番組に出ることになったが、大物を釣るまで帰れないという。さて、動きの少ない釣りでどうやって目立つか……。\n特技 : 《キャラ分野の空白／キャラ7》",
            25 => "パートナープレイヤーの「嫌いなもの」を題材にした番組コーナーで、いじり役を任されることになった。\n特技 : パートナープレイヤーの修得しているキャラ分野の特技",
            26 => "クイズ番組に出演。問題とどう向き合うか、それが大事だ。\n特技 : 《学力／才能10》",
            33 => "オフ",
            34 => "農作業体験番組に出演。クワを持って畑に出かけよう。\n特技 : 《体力／才能6》",
            35 => "工作体験番組に出演。いい物をスタジオにお届けできるよう、物づくりを真剣に行おう。\n特技 : 《集中力／才能4》",
            36 => "電子ゲームやアナログゲームを遊ぶ番組に出演。どんな風に盛り上げられるかな？\n特技 : 《ゲーム／趣味10》",
            44 => "オフ",
            45 => "今日は漫才をするようだ。笑わせるには、何が必要だろうか。\n特技 : 《ばか／キャラ12》",
            46 => "シチュエーションコントに出演。大げさな演技が求められる。\n特技 : 《演技力／才能12》",
            55 => "オフ",
            56 => "趣味的な番組に出ることになった。今日のテーマは何かな。\n特技 : 《趣味分野の空白／趣味7》",
            66 => "オフ",
          }
        ),
        "MU" => DiceTable::D66Table.new(
          "音楽関係仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "シーンプレイヤーとパートナープレイヤーでミニライブをすることになった。うまく声を合わせよう。\n特技 : パートナープレイヤーの修得している属性分野の特技",
            13 => "歌番組で取り上げられる。どんな気持ちで歌ったのか、うまく表現して伝えよう。\n特技 : 《パッション／属性8》",
            14 => "パートナープレイヤーとハーモニーを重ねる歌がやってきた。二人の特徴をうまく声に乗せよう。\n特技 : パートナープレイヤーの修得している才能分野の特技",
            15 => "CDの手渡し販売が開始。心を込めて、笑顔で手渡しだ。\n特技 : 《笑顔／才能7》",
            16 => "レコーディングに音楽業界の大物が立ち会う。緊張せず、自分の実力を発揮しよう。\n特技 : 《胆力／才能5》",
            22 => "オフ",
            23 => "パートナープレイヤーと話し合って歌詞を作ることになった。お互いのことをよく理解しよう。\n特技 : パートナープレイヤーの修得しているキャラ分野の特技",
            24 => "活動範囲を広げるために、色々な楽器に挑戦！\n特技 : 《音楽／趣味11》",
            25 => "高級そうなバーで歌うことに。高級感のあるファッションを身につけることを条件に歌うことを許される。\n特技 : 《セレブ／才能11》",
            26 => "中学生がターゲットのCDを販売することになった。心の中の中学生を解放するときが来た！\n特技 : 《中二病／キャラ2》",
            33 => "オフ",
            34 => "子供向けの歌を作ることになった。視線を子供に近づけないと。\n特技 : 《～125／身長2》",
            35 => "結婚式の歌を任される。祝福の気持ちを込めて歌おう。\n特技 : 《気配り／才能9》",
            36 => "レースを盛り上げるアップテンポな曲を作ることに。\n特技 : 《元気／キャラ8》",
            44 => "オフ",
            45 => "パートナープレイヤーの地元を象徴するような歌を作ることになった。地元の話を聞き出そう。\n特技 : パートナープレイヤーの修得している出身分野の特技",
            46 => "ホラームービーの主題歌を担当することになった。怖さを声で表現できるだろうか？\n特技 : 《オカルト／趣味2》",
            55 => "オフ",
            56 => "作曲家の先生と打ち合わせ。自分のイメージをうまく伝えられるかな？\n特技 : 《物腰丁寧／キャラ10》",
            66 => "オフ",
          }
        ),
        "DR" => DiceTable::D66Table.new(
          "ドラマ関係仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "エキストラで出演。できるだけ目立たないように……。\n特技 : 《プレーン／属性7》",
            13 => "刑事ドラマに刑事役で出演。クールに決めよう。\n特技 : 《クール／属性11》",
            14 => "刑事ドラマに犯人役で出演。悪いことをはぐらかす演技が必要だ。\n特技 : 《ミステリアス／キャラ3》",
            15 => "医療ドラマに医者役で出演。臓器や血にひるまずがんばろう。\n特技 : 《胆力／才能5》",
            16 => "再現アニメの吹き替えに挑戦。できるだけ丁寧に。\n特技 : 《物腰丁寧／キャラ10》",
            22 => "オフ",
            23 => "悪役に挑戦。暗い気持ちが必要だ。\n特技 : 《ダーク／属性3》",
            24 => "学園ドラマに悩める生徒役で出演。青春らしさをどこまで見せようか。\n特技 : 《中二病／キャラ2》",
            25 => "時代劇に出演。硬派に決めるシーンがやって来た。\n特技 : 《硬派／キャラ9》",
            26 => "特撮にヒーロー役で出演。熱い演技を見せるとき！\n特技 : 《バーニング／属性10》",
            33 => "オフ",
            34 => "共演者に超有名人が！　緊張せずにがんばろう。\n特技 : 《マイペース／キャラ4》",
            35 => "気難しい監督にいろいろ注意される。どう対応したものか……。\n特技 : 《スター／属性12》",
            36 => "パートナープレイヤーの【背景】を再現したミニドラマを撮るようだ。彼の過去をどう表現したものか。\n特技 : パートナープレイヤーの修得している属性分野の特技",
            44 => "オフ",
            45 => "アクションドラマに出演。アクションを決められるかどうかがカギだ。\n特技 : 《運動神経／才能8》",
            46 => "恋愛ドラマに出演。共演者をどきどきさせる演技が必要とのこと。\n特技 : 《セクシー／属性4》",
            55 => "オフ",
            56 => "感動系ドラマに出演。泣くシーンは、ここ一番の見せ場だ！\n特技 : 《演技力／才能12》",
            66 => "オフ",
          }
        ),
        "VI" => DiceTable::D66Table.new(
          "ビジュアル関係仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "ビーチでグラビア撮影の仕事が入る。肉体美を見せるとき。\n特技 : 《セクシー／属性4》",
            13 => "ファッション誌の取材がやって来て、自分らしいファッションを見せてほしいと頼まれる。\n特技 : 《キャラ分野の空白／キャラ7》",
            14 => "地方ごとのファッションを取り入れるファッションショーが開幕。出演することに。\n特技 : 出身分野からランダム",
            15 => "ファッションショーにモデルとして登場。完璧なスタイルを見せつけろ。\n特技 : 《スタイル／才能3》",
            16 => "雑誌でシーンプレイヤーおすすめコーデを紹介するようだ。どんな組み合わせを街に発信しようか。\n特技 : 《おしゃれ／趣味5》",
            22 => "オフ",
            23 => "パートナープレイヤーの「身体的特徴」がちょっとした流行になった。乗るしかない、このビッグウェーブに。\n特技 : パートナープレイヤーが修得している身長分野の特技",
            24 => "深夜番組の1コーナーに、シーンプレイヤーの「身体的特徴」の特集が組まれるようだ。それに乗っかろう。\n特技 : シーンプレイヤーが修得している身長分野の特技",
            25 => "ニュース番組の1コーナーで、パートナープレイヤーの「ファッション特徴」が紹介される。うまくアシストしよう。\n特技 : パートナープレイヤーが修得している身長分野の特技",
            26 => "シーンプレイヤーの「ファッション特徴」を売っている企業から、CMに出てくれないかと頼まれる。\n特技 : シーンプレイヤーが修得している属性分野の特技",
            33 => "オフ",
            34 => "女性のファッションについて語る番組に出演。\n特技 : 《フェミニン／属性5》",
            35 => "高い身長向けの衣装が届いた。これを使ってうまく魅せられるのか？\n特技 : 《190～／身長12》",
            36 => "テレビ番組でアニメキャラのコスプレをすることに。自分らしく決めポーズ。\n特技 : 《趣味分野の空白／趣味7》",
            44 => "オフ",
            45 => "低身長向けコーデを作ったデザイナーから連絡が入る。それを見事に着こなしてほしいとのこと。\n特技 : 《146／身長6》",
            46 => "子供と共演するCMを撮ることになった。子供に愛されるファッションを考えよう。\n特技 : 《～125／身長2》",
            55 => "オフ",
            56 => "パートナープレイヤーを宣材用の撮影向けにコーディネートすることになった。さて、どうしてやろうか。\n特技 : パートナープレイヤーが修得している身長分野の特技",
            66 => "オフ",
          }
        ),
        "SP" => DiceTable::D66Table.new(
          "スポーツ仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "マラソン大会に参加することになった。とにかく、走ろう。\n特技 : 《体力／才能6》",
            23 => "サッカー選手たちにインタビュー！　サッカーの魅力を聞き出そう。\n特技 : 《スポーツ／趣味4》",
            24 => "野球の始球式をすることになった。自分らしく、キャラクターを前面に出して投げるのがコツ。\n特技 : 《キャラ分野の空白／キャラ7》",
            25 => "バスケットボールを体験！　その魅力を伝えよう。\n特技 : 《スポーツ／趣味4》",
            26 => "ラグビーのパワフルさを間近で体験。見ている人たちにも迫力を伝えないと。\n特技 : 《スポーツ／趣味4》",
            33 => "アメフトのハーフタイムショーの短い時間を任される。集中して魅力を出し切ろう。\n特技 : 《集中力／才能4》",
            34 => "チアリーディング（男性アイドルは応援団）でスポーツ選手たちの応援をすることに。みんながんばれ！\n特技 : 《キュート／属性6》",
            35 => "陸上競技を一通り体験！　それぞれの種目の見どころを発信しよう。\n特技 : 《運動神経／才能8》",
            36 => "水泳をする仕事がやってきた。競泳水着をカッコよく着こなそう。\n特技 : 《クール／属性11》",
            44 => "スポーツドリンクのCMだ。「生き返る」感じを出していこう。\n特技 : 《パッション／属性8》",
            45 => "運動靴のCM。パートナープレイヤーを力強く追い抜いて、速くなれることをアピール！\n特技 : 《バーニング／属性10》",
            46 => "ジャージや体操服のCMが入ってきた。うまく着こなして、運動着もおしゃれなことを証明しよう。\n特技 : 《おしゃれ／趣味5》",
            55 => "近々開催される大会の応援団長を任された。出場する選手たちにエールを送ろう！\n特技 : 《元気／キャラ8》",
            56 => "テニスの試合をパートナープレイヤーとやることになった。ダブルスでいこう。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            66 => "ゴルフコースを回りながら、プロから手ほどきを受けることに。丁寧な言葉遣いで、大人っぽく振舞おう。\n特技 : 《物腰丁寧／キャラ10》",
          }
        ),
        "CHR" => DiceTable::D66Table.new(
          "クリスマス仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "雪の積もる野外コンサートホールでミニライブ。苛酷な環境だけど、耐え抜かないと。\n特技 : 《体力／才能6》",
            23 => "ラジオの公開録音中に、クリスマスケーキ作りにチャレンジすることになった。うまく作れるかな？\n特技 : 《料理／趣味6》",
            24 => "アイドルが提案するクリスマスデート用のファッションを雑誌で紹介。勝てるコーデを考えてみよう。\n特技 : 《おしゃれ／趣味5》",
            25 => "ケーキ屋さんと提携して、クリスマスケーキの売り込みをすることに。\n特技 : 《ショッピング／趣味8》",
            26 => "地元の中学校のクリスマスイベントに登場。学生のみんなと一緒に盛り上がろう。\n特技 : 《パッション／属性8》",
            33 => "クリスマスに放映される特別ドラマにパートナープレイヤーの恋人役で出演。恋愛をうまく演じられるかな？\n特技 : 《演技力／才能12》",
            34 => "トークバラエティのクリスマス特番に呼ばれて収録を始める。本日のテーマは、「恋」について。\n特技 : 《軟派／キャラ5》",
            35 => "ラジオ番組で、家族と過ごすクリスマスの思い出について語ることになった。\n特技 : 《異国文化／才能2》",
            36 => "セクシーサンタグランプリというファッション大会に出ることになった。セクシーアイドルたちと対決だ！\n特技 : 《セクシー／属性4》",
            44 => "遊園地で行われるクリスマスイベントのCMを撮影することになった。楽しそうな笑顔を見せよう。\n特技 : 《笑顔／才能7》",
            45 => "サンタクロースの格好をして、小学生たちにプレゼントを配ることになった。オファーはかわいさ重視！\n特技 : 《キュート／属性6》",
            46 => "サンタクロースの格好をして、街でイベントをすることに。異国っぽさをうまく出せるかな？\n特技 : 《海外／出身12》",
            55 => "クリスマスをテーマにした写真集が発売。そのうちの何枚かを担当することに。\n特技 : 《スタイル／才能3》",
            56 => "新人アイドルたちが歌うクリスマスソングを収めたカバーアルバムが発売。自分たちも収録されています。\n特技 : 《音楽／趣味11》",
            66 => "アイドルとデートをした気分になれるDVDが発売。自分たちも、クリスマス編の収録を行った。\n特技 : 《アイドル／趣味12》",
          }
        ),
        "PAR" => DiceTable::D66Table.new(
          "パートナー関係仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "パートナープレイヤーの【背景】に関する仕事がやって来る。こいつは何を見てきたんだ？\n特技 : パートナープレイヤーの個性特技",
            23 => "パートナープレイヤーの「好きなもの」に関する仕事がやって来る。場を盛り上げていこう。\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            24 => "パートナープレイヤーの「嫌いなもの」に関する仕事がやって来る。どうフォローしたものか。\n特技 : パートナープレイヤーが修得しているキャラ分野の特技",
            25 => "パートナープレイヤーの「身体的特徴」に関する仕事がやって来る。どこがいいのかを聞いてみる。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            26 => "パートナープレイヤーの「ファッション特徴」に関する仕事がやって来る。自分も真似をすることに。\n特技 : パートナープレイヤーが修得している身長分野の特技",
            33 => "パートナープレイヤーの個性特技に関する仕事がやって来る。合わせてみよう。\n特技 : パートナープレイヤーの個性特技",
            34 => "パートナープレイヤーの「身体的特徴」に関する仕事がやって来る。どこがいいのかを聞いてみる。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            35 => "パートナープレイヤーが修得している属性分野の特技に関する仕事がやって来る。\n特技 : パートナープレイヤーが修得している属性分野の特技",
            36 => "パートナープレイヤーが修得しているキャラ分野の特技に関する仕事がやって来る。\n特技 : パートナープレイヤーが修得しているキャラ分野の特技",
            44 => "シーンプレイヤーの【背景】を振り返らせるような仕事がやって来た。今はアイドルとしてそれをこなそう。\n特技 : シーンプレイヤーの個性特技",
            45 => "パートナープレイヤーが修得している趣味分野の特技に関する仕事がやって来る。\n特技 : パートナープレイヤーが修得している趣味分野の特技",
            46 => "パートナープレイヤーが修得している出身分野の特技に関する仕事がやって来る。\n特技 : パートナープレイヤーが修得している出身分野の特技",
            55 => "シーンプレイヤーの個性特技に関する仕事がやって来る。今こそ見せ場だ！\n特技 : シーンプレイヤーの個性特技",
            56 => "パートナープレイヤーが修得している才能分野の特技に関する仕事がやって来る。\n特技 : パートナープレイヤーが修得している才能分野の特技",
            66 => "シーンプレイヤーの「好きなもの」に関する仕事がやって来る。やったぜ！\n特技 : シーンプレイヤーの個性特技",
          }
        ),
        "SW" => DiceTable::D66Table.new(
          "お菓子仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "おいし過ぎて止まらない様子を描く、ふわふわなお菓子のCMを行う。\n特技 : 《ポップ／属性9》",
            23 => "苦い恋模様を描く、ビターチョコレートのCM撮影を行う。\n特技 : 《ダーク／属性3》",
            24 => "甘い恋模様を描く、甘いチョコレートのCM撮影を行う。\n特技 : 《キュート／属性6》",
            25 => "家でポリポリ食べているところを描く、スナック菓子のCMを行う。\n特技 : 《プレーン／属性7》",
            26 => "青春の汗を流す様子を描く、甘い飲料水のCMを行う。\n特技 : 《バーニング／属性10》",
            33 => "チョコレートを食べて脳細胞を活性化させる探偵のドラマに出演する。\n特技 : 《集中力／才能4》",
            34 => "朝のシリアルを食べて元気いっぱいな様子を描く、CM撮影を行う。\n特技 : 《元気／キャラ8》",
            35 => "眠いときに目がすっきりと覚める様子を描く、刺激の強いお菓子のCM撮影を行う。\n特技 : 《パッション／属性8》",
            36 => "一本で栄養補給ができる様子を描く、健康補助食品なお菓子のCM撮影を行う。\n特技 : 《クール／属性11》",
            44 => "地元にある駄菓子屋さんのプロモーションを手伝う。\n特技 : 《ショッピング／趣味8》",
            45 => "料理番組で、市販のお菓子を使った新しいおやつの開発を任される。\n特技 : 《料理／趣味6》",
            46 => "お菓子の家を再現したアトラクション施設を宣伝する。\n特技 : 《フェミニン／属性5》",
            55 => "情報番組の1コーナーで、お勧めのケーキを紹介する。\n特技 : 《料理／趣味6》",
            56 => "お菓子をテーマにした、夢いっぱいの遊園地の宣伝を行う。\n特技 : 《笑顔／才能7》",
            66 => "チョコレートを使ったグラビア撮影をすることになる。\n特技 : 《スタイル／才能3》",
          }
        ),
        "AN" => DiceTable::D66Table.new(
          "動物仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "ライオンの檻に、餌を届ける仕事がやって来る。勇気を出して踏み込もう。\n特技 : 《胆力／才能5》",
            23 => "ハムスターと戯れる絵を作る。\n特技 : 《ペット／趣味4》",
            24 => "牛の乳しぼり体験を動画にしよう。\n特技 : 《集中力／才能4》",
            25 => "かわいい猫の動画を撮るために、きまぐれな猫の機嫌をとりにいく。\n特技 : 《ペット／趣味4》",
            26 => "犬の散歩シーンを撮るためにも、犬と信頼関係を作る。\n特技 : 《ペット／趣味4》",
            33 => "公園の鳩に餌をあげるシーンの手伝いをする。\n特技 : 《マイペース／キャラ4》",
            34 => "象の上に乗って、コメントを述べる仕事。\n特技 : 《エスニック／属性2》",
            35 => "ぬるぬるしたどじょうを手づかみする絵を要求される。\n特技 : 《セクシー／属性4》",
            36 => "ウサギをなでる絵を作る仕事がやって来る。不安そうなウサギを安心させよう。\n特技 : 《ペット／趣味4》",
            44 => "奈良の鹿に餌をあげるドラマに出演。\n特技 : 《近畿地方／出身6》",
            45 => "馬に乗って、競馬場を駆ける映像を撮ることに。うまく乗りこなそう。\n特技 : 《セレブ／才能11》",
            46 => "水族館でペンギンたちと一緒に遊ぶシーンを撮影。\n特技 : 《キュート／属性6》",
            55 => "蛇を手づかみする番組企画が入る。\n特技 : 《胆力／才能5》",
            56 => "海に入って、魚や貝を見つける企画をすることになった。\n特技 : 《元気／キャラ8》",
            66 => "山奥で歩き回って、色々な昆虫を見つける仕事を行う。\n特技 : 《体力／才能6》",
          }
        ),
        "MOV" => DiceTable::D66Table.new(
          "映画仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "ゾンビ映画にゾンビ役で出演。動く死体らしい演技を心がけよう。\n特技 : 《ダーク／属性3》",
            23 => "時代劇映画にサムライ役で出演。厚い忠義を見せよう。\n特技 : 《硬派／キャラ9》",
            24 => "西部劇映画にガンマン役で出演。静かに熱い役を演じよう。\n特技 : 《バーニング／属性10》",
            25 => "SF映画に未来のエンジニア役で出演。難しい言葉をクールに言い放とう。\n特技 : 《クール／属性11》",
            26 => "カンフー映画に若き拳法家役で出演。激しいアクションで敵と戦おう。\n特技 : 《運動神経／才能8》",
            33 => "恋愛映画に当て馬役として出演。フラれたあとに感情的になる演技が大事。\n特技 : 《演技力／才能12》",
            34 => "現代劇に中学二年生役として出演。現代の若者を演技で表現しよう。\n特技 : 《中二病／キャラ2》",
            35 => "特撮ヒーローにヒーロー役として出演。スーツアクターのアクションに、アフレコで魂を載せよう。\n特技 : 《演技力／才能12》",
            36 => "ホラー映画に主役として出演。悲鳴や動きで怖がっているところを見せよう。\n特技 : 《ダーク／属性3》",
            44 => "インド映画にダンサーとして出演。情熱的な踊りで映画を盛り上げよう。\n特技 : 《ダンス／趣味9》",
            45 => "ミステリー映画の犯人役として出演。怪しげな演技で人々を魅了しよう。\n特技 : 《ミステリアス／キャラ3》",
            46 => "戦争映画に出演。哀しみの叫びを上げよう。\n特技 : 《演技力／才能12》",
            55 => "ちょっとしたお色気シーンを撮ることに。\n特技 : 《セクシー／属性4》",
            56 => "ドキュメンタリー映画で、過去の偉人を演じることに。その人の一生をトレースしよう。\n特技 : 《演技力／才能12》",
            66 => "おバカな映画に、突き抜けたバカ役として出演。バカになれ！\n特技 : 《ばか／キャラ12》",
          }
        ),
        "FA" => DiceTable::D66Table.new(
          "ファンタジー仕事表",
          D66SortType::ASC,
          {
            11 => "オフ",
            12 => "オフ",
            13 => "オフ",
            14 => "オフ",
            15 => "オフ",
            16 => "オフ",
            22 => "ドラゴンと対峙しても、引かない勇気を見せるシーン。\n特技 : 《胆力／才能5》",
            23 => "怪物の群れを魔法で一掃するシーン。\n特技 : 《ポップ／属性9》",
            24 => "剣を使って街を荒らす盗賊たちを成敗するシーン。\n特技 : 《硬派／キャラ9》",
            25 => "斧を振るって、動く植物を破壊するシーン。\n特技 : 《体力／才能6》",
            26 => "仲間と一緒に槍で突いて、敵の兵士を追い返すシーン。\n特技 : 《気配り／才能9》",
            33 => "歌と踊りでファンタジーの住民たちを惹きつけるシーン。\n特技 : 《音楽／趣味11》",
            34 => "酒場で芸を披露して、人気者になるシーン。\n特技 : 《軟派／キャラ5》",
            35 => "無実の罪でとらえられ、牢屋から脱出するシーン。\n特技 : 《ミステリアス／キャラ3》",
            36 => "突然現れた魔物の群れに襲われるシーン。\n特技 : 《どじ／キャラ11》",
            44 => "巨大な魔物に、みんなで立ち向かっていくシーン。\n特技 : 《気配り／才能9》",
            45 => "悪の魔法使いによって、呪いをかけられるシーン。\n特技 : 《ダーク／属性3》",
            46 => "新しい武器と防具を調達して、着こなすシーン。\n特技 : 《おしゃれ／趣味5》",
            55 => "一面の草原を駆け抜けるシーン。\n特技 : 《元気／キャラ8》",
            56 => "疲れている王様を元気づけてあげるシーン。\n特技 : 《パッション／属性8》",
            66 => "空を駆ける不思議な船に乗って、感動するシーン。\n特技 : 《笑顔／才能7》",
          }
        ),
      }.freeze

      class WorkWithChanceTable < DiceTable::D66Table
        def roll(randomizer, chance)
          chosen = super(randomizer)
          unless chance
            return chosen
          end

          m = /チャンスが(\d{1,2})以下ならオフ。/.match(chosen.body)
          if m && m[1].to_i >= chance
            DiceTable::RollResult.new(chosen.table_name, chosen.value, "オフ")
          elsif m
            DiceTable::RollResult.new(chosen.table_name, chosen.value, chosen.body.sub(/チャンスが(\d{1,2})以下ならオフ。/, ""))
          else
            chosen
          end
        end
      end

      LocalWorkTable = WorkWithChanceTable.new(
        "地方アイドル仕事表",
        D66SortType::ASC,
        {
          11 => "オフ",
          12 => "オフ",
          13 => "握手会をすることになった。遠方から自分たち目当てにやって来るお客さんも多数見える。チャンスが5以下ならオフ。\n特技 : 《アイドル／趣味12》",
          14 => "ミニコンサートが全国放送で小さく紹介される。ちょっとだけ、外見が注目されたみたいだ。チャンスが4以下ならオフ。\n特技 : 《スタイル／才能3》",
          15 => "地元ラジオ局で自分たちの番組が始まる。チャンスが3以下ならオフ。\n特技 : 《キャラ分野の空白／趣味7》",
          16 => "地元のテレビ局にゲスト出演。うまく自分たちを紹介できるだろうか？　チャンスが3以下ならオフ。\n特技 : 好きな出身分野の特技",
          22 => "オフ",
          23 => "街頭でティッシュ配りの手伝いをする。笑顔を忘れずに、がんばろう。\n特技 : 《笑顔／才能7》",
          24 => "地元のお手伝いの一環として、害虫退治に駆り出された。なぜ、こんなことに。\n特技 : 《胆力／才能5》",
          25 => "畑仕事のお手伝いをすることになった。とりあえず、体力が要求される。\n特技 : 《体力／才能6》",
          26 => "ショッピングモールのお手伝いをすることになった。うまくお手伝いができれば、繁盛するかも。\n特技 : 《ショッピング／趣味8》",
          33 => "オフ",
          34 => "インターネットラジオに出演。声とトークで。地域のことを伝えていこう。\n特技 : 《異国文化／才能2》",
          35 => "地元のテレビ局の取材が入る。テーマは、地方でがんばっている人たちだ。\n特技 : 《元気／キャラ8》",
          36 => "デパートで風船を配るお手伝い。子どもたち相手のお仕事は、ちょっと大変です。\n特技 : 《気配り／才能9》",
          44 => "オフ",
          45 => "着ぐるみを着て、市民と交流。暑くてつらい仕事だけど、大切な交流の時間です。\n特技 : 《バーニング／属性10》",
          46 => "観光地の物販コーナーで地元の特産品を売るお手伝い。地方アイドル的に、大切なお仕事。\n特技 : 好きな出身分野の特技",
          55 => "オフ",
          56 => "動画サイトのチャンネルで、自分たちの宣伝を行なうことに。世界中に発信！\n特技 : 《スター／属性12》",
          66 => "オフ",
        }
      )

      def roll_work_table(command)
        if (m = /^LO([1-6]{1,2})?$/.match(command))
          LocalWorkTable.roll(@randomizer, m[1]&.to_i)
        else
          WORK_TABLE[command]&.roll(randomizer)
        end
      end
    end
  end
end
