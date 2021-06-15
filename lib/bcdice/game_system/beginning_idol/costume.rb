# frozen_string_literal: true

module BCDice
  module GameSystem
    class BeginningIdol < Base
      class CostumeTable
        # @param name [String]
        # @param items [Hash{Integer => String}]
        def initialize(name, items)
          @name = name
          @items = items
        end

        # @param randomizer [Randomizer]
        # @return [String]
        def roll(randomizer)
          value = randomizer.roll_d66(D66SortType::ASC)
          "#{@name}(#{value}) ＞ #{@items[value]}"
        end

        # @return [DiceTable::D66Table]
        def brand_only()
          DiceTable::D66Table.new(
            @name,
            D66SortType::ASC,
            @items.transform_values { |e| e.split("\n").first }
          )
        end
      end

      COSTUME_CHALLENGE_GIRLS = CostumeTable.new(
        "衣装(チャレンジガールズ)",
        {
          11 => "１２＆８８\n自分の【パフォーマンス値】が決定したとき、その値を2点上昇する。",
          12 => "Glow Up Princess\nパフォーマンスを行うとき、サイコロを追加で1つ振れる。",
          13 => "しずく\nライブフェイズ開始時に、【メンタル】が5点上昇する。",
          14 => "Pop☆Sweet\n自分の【メンタル】が上昇するとき、さらに1点上昇する。",
          15 => "Ttype\n一芸突破をしても【メンタル】が減少しない。また、一芸突破をした時、達成値が1点上昇する。",
          16 => "Vampire Story\nパフォーマンスの【パフォーマンス値】が10以上の場合、自分の【メンタル】が3点上昇する。",
          22 => "Pure Mermaid\n【ビジュアル】の演目は、指定特技を《スタイル》に変更できる。指定特技が《スタイル》の演目では、【パフォーマンス値】が2点上昇する。",
          23 => "I'm cute\nライブフェイズ開始時に【メンタル】が1点上昇する。幕間の開始時に能力値を1つ選ぶ。選ばれた能力値は、このライブフェイズの間、1点上昇する。",
          24 => "No.1 Girl\n【パフォーマンス値】が決定するとき、【メンタル】を1点減少することで、【パフォーマンス値】が3点上昇する。",
          25 => "Final Romance\n【ビジュアル】のパフォーマンスを行うとき、キャラクターを1人選ぶ。選んだキャラクターの自分に対する【理解度】と同じだけ、【パフォーマンス値】が上昇する。",
          26 => "Prism Line\nパフォーマンス1回につき、1度だけパフォーマンスに使用したサイコロ1つを振り直すことができる。",
          33 => "さーばんとさーびす\nシンフォニーを行うたびに、そのパフォーマンスの【パフォーマンス値】が3点上昇する。",
          34 => "Travel Bag\n幕間に自分の【理解度】チェック1つを外すことができる。",
          35 => "JewelC\n開幕演目と幕間にアイテムを1つ選んで獲得する。",
          36 => "Sweet Girl\nパフォーマンスを行ったPCは、【メンタル】を2点上昇する。",
          44 => "Satisfaction West\nミラクル、ミラクルシンクロ、パーフェクトミラクルが発生したとき【パフォーマンス値】を5点上昇する。",
          45 => "Under Big Ben\n使用能力が【ボイス】のパフォーマンスの【パフォーマンス値】が10以上の場合、自分に対する【理解度】チェック1つを外すことができる。",
          46 => "PIERO\n一芸突破の達成値が2点上昇する。",
          55 => "甘々娘々\n使用能力が【ビジュアル】のパフォーマンスを行うとき、【パフォーマンス値】が3点上昇する。",
          56 => "花鳥風月\nシンフォニーを行うとき、振るサイコロの数を1つ増やす、もしくは1つ減らすことができる。",
          66 => "Jingle Bells\nリザルトフェイズに以下の効果が発生する。リザルトフェイズに、【獲得ファン人数】が1D6点上昇する。また、PC全員は、条件を満たしていなくても「お願い」をすることができる。",
        }
      ).freeze

      COSTUME_ROAD_TO_PRINCE = CostumeTable.new(
        "衣装(ロードトゥプリンス)",
        {
          11 => "Angel kiss\nパフォーマンスを行うとき、1の目が出たサイコロは取り除かれない。シンフォニーを行ったとき、1の目が出たサイコロをすべて取り除く。",
          12 => "Pirate ship\n指定特技が属性分野の演目を行うとき、その指定特技を《セクシー／属性4》に変更することができる。",
          13 => "ロードトゥプリンス\nミラクル、ミラクルシンクロ、パーフェクトミラクルが発生したとき、そのキャラクターは【メンタル】が10点上昇する。",
          14 => "Princess Guardian\n自分以外のキャラクターの【メンタル】が0点になったときに、《気配り／才能9》で判定を行うことができる。この判定には、個性特技は使用できない。成功すると、そのキャラクターは、【獲得ファン人数】が半分にならない。",
          15 => "Starlight TourS\nライブフェイズの間、演目を1つ選んで、指定特技を《スター／属性12》に変更できる。",
          16 => "花鳥風月・裏\nライブフェイズ中、一度だけ場に残っているすべてのサイコロの目を反転（1なら6に、2なら5に、3なら4に）することができる。",
          22 => "しくらま\n判定に使用したサイコロの目が7の場合、【メンタル】が7点上昇する。",
          23 => "Chime\nミラクル、ミラクルシンクロ、パーフェクトミラクルが発生したとき、そのキャラクターはランダムにアイテムを1つ獲得する。",
          24 => "砂上の光\nシンフォニーを行ったとき、シンフォニーを受けたキャラクターの【メンタル】が5点上昇する。",
          25 => "Air by me\n幕間の開始時に、【メンタル】が5点上昇する。",
          26 => "戦国ストリート\n演目の使用能力が【フィジカル】のとき、【パフォーマンス値】が2点上昇する。また、指定特技が《ダンス／趣味9》の場合、【パフォーマンス値】が2点上昇する。",
          33 => "Wild man\n一芸突破の達成値が2点上昇する。ただし、スペシャルは発生しなくなる。",
          34 => "Gray Stand\n【獲得ファン人数】が減少したとき、減少した値の半分（端数切り捨て）と同じ値だけ、【獲得ファン人数】が上昇する。",
          35 => "トイ ARM\n演目の開始時に、2D6を振る。その結果が11以上の場合、この演目では【メンタル】が減少しない。",
          36 => "white plan\nファンブルが発生しても変調を受けない。",
          44 => "SINOBI\n開幕演目を行うとき、出ないことを選択することができる。",
          45 => "V-X\nミラクルが発生したときの【パフォーマンス値】を15にできる。",
          46 => "ドラゴンナックル\n幕間より後、PCが行うパフォーマンスの【パフォーマンス値】が4点上昇する。",
          55 => "Halloween Magic\n後半PPによって【メンタル】が減少するとき、その値を4点減少する（最低0）。",
          56 => "Satisfaction East\n【獲得ファン人数】が減少したとき、【メンタル】を20点にすることができる。",
          66 => "Devil kiss\nパフォーマンスを行うとき、6の目が出たサイコロは取り除かれない。シンフォニーを行ったとき、6の目が出たサイコロをすべて取り除く。",
        }
      ).freeze

      COSTUME_FORTUNE_STARS = CostumeTable.new(
        "衣装(フォーチュンスターズ)",
        {
          11 => "常峰製作所\n第一演目では、【メンタル】が減少しない。",
          12 => "フォーチュンスター\n最終演目の【パフォーマンス値】が「【メンタル】÷2（端数切り捨て）」点上昇する。",
          13 => "ファイタースケイル\n【メンタル】が5点以下の場合、【パフォーマンス値】が1D6点上昇する。",
          14 => "Blood Scissors\n自分以外のキャラクター一人の【メンタル】を5点減少するか、プロデューサーに変調「怪我」を与えることで、自分の【メンタル】が5点上昇する。この効果は、プロデューサーが既に「怪我」の変調を受けていると、使用できない。",
          15 => "蒸気式演技服\n判定を行うとき、【メンタル】を1点消費することで、判定の達成値が1点上昇する。",
          16 => "ウェイトスター\n「スタミナドリンク」によって、他のキャラクターの【メンタル】を上昇する場合、さらに4点上昇する。",
          22 => "Little Stage\n判定のサイコロやパフォーマンスで「1」の出目が1つ以上出た場合、【思い出】を1つ獲得する。",
          23 => "Check It\n開幕演目前に、最終演目以外の好きな演目を指定する。指定された演目では、自分の【メンタル】が減少しない。",
          24 => "12 Sword\nアイドル戦闘ルールを使用しているとき、与えるダメージが3点上昇し、上昇する【獲得ファン人数】が5点上昇する。",
          25 => "Magi Magic\nパフォーマンスや自分が行うシンフォニーでサイコロを取り除くたびに、【メンタル】が2点上昇する。",
          26 => "Jokers\n最終演目に行う一芸突破の目標値が3点減少する。",
          33 => "Papillon Club\n自分以外のキャラクターがタイプが「補助」のアイドルスキルを使用するたびに、【メンタル】が3点上昇する。",
          34 => "ネイキッドチャレンジ\n開幕演目開始時に、【メンタル】が5点減少する。このライブフェイズの間、好きな能力値が3点上昇する。",
          35 => "Cold Vivit\n好きなギャップを1つ埋める。このギャップは、ライブフェイズ終了時に元に戻る。",
          36 => "対魔絶伏\n特別な演目では、【メンタル】が減少しない。",
          44 => "Rescue Power\n演目の判定でファンブルが発生した場合、好きな能力値でパフォーマンスを行うことができる。",
          45 => "アニマルエンジン\n幕間の終了時に、好きな動物からの【理解度】が2点上昇する。",
          46 => "ふわふわキッチン\n好きなときに、「お菓子」を一つ消費することで、好きなキャラクターの【メンタル】が1D6点上昇できる。また、幕間に「お菓子」を1つ獲得する。",
          55 => "Night Talk\n幕間で「信用」を行ったとき、上昇する【メンタル】が10点になる。",
          56 => "ティーチングタイム\n自分以外のキャラクターを1人指定する。このライブフェイズの間、指定されたPCの能力値が1点上昇する。",
          66 => "See Diver\n演目名に「海」「水」「泡」「湖」「風呂」を含む演目を行った場合、【獲得ファン人数】が1D6点上昇する。",
        }
      ).freeze
    end
  end
end
