# Commainder
バッチファイル謹製リマインダー。`r 180 カップラーメン` で 3 分後に「カップラーメン」と表示。

## デモ
たとえばファイル名を指定して実行から、以下のようにして指定します。

![from_run](https://user-images.githubusercontent.com/23325839/47912109-d43ffc00-deda-11e8-9b72-24c560164126.png)

動作中は DOS 窓が動きますので、適当に最小化でもしておいてください。

![working](https://user-images.githubusercontent.com/23325839/47912160-03566d80-dedb-11e8-884e-3d06354ece6b.png)

時間になると、以下のように **最大化表示したメモ帳** でリマインドされます。(※以下は早くキャプチャしたいので横着して 3 秒リマインド `r 3 カップラーメン` を実行した例ですが)

![remind](https://user-images.githubusercontent.com/23325839/47912131-e9b52600-deda-11e8-9535-6b504b75925f.png)

## 動作環境
- Windows 7 以降

## 使い方
- (1) `r.bat` を実行する
  - データフォルダが `%userprofile%\.commainder` 配下に生成されます
- (2) `r.bat` をパスの通ったフォルダに配置してください
  - てっとり早くやりたいなら `open_windows_folder_passed_to_PATH.bat` を実行し、開かれた Windows フォルダに配置します

すると「ファイル名を指定して実行」や「コマンドプロンプト」から r.bat を呼び出せるようになります。

呼び出し例:

- 3分後に「カップラーメン」と表示
  - → `r 180 カップラーメン`
- 3分後にリマインド（メッセージ内容を省略する）
  - → `r 180`

一般的なフォーマット:

- `r (秒数) (リマインド内容)`
- 秒数は省略すると 0 とみなされ、即座にリマインドされます。
- リマインド内容は省略できます。

## 技術的な話
Commainder の実装や疑問や不満など、技術的なことを Q&A 形式でまとめておきます。技術的に興味がある方向けです。ただ使うだけなら読む必要はありません。

### Q: なぜバッチファイル謹製？
Ans: ただの好奇心です。

バッチファイルだけでリマインダーを作る、というチャレンジが面白そうだなぁと。

### Q: なぜ「メモ帳を最大化して表示」という方法を選んだ？
Ans: なるべく確実にリマインド内容に気付かせるためです。

リマインドするためには「指定したメッセージを何らかの手段で表示」させることが必要ですが、Windows 標準機能だけでは、これを行える仕組みがありません。

- msg コマンドは？
  - ダイアログボックスが小さく、気づきにくいので却下しました
- Powershell や VBScript は？
  - 動作が重たいし、バッチファイルから外れるので却下しました

上手い表示方法が浮かばず、苦戦していたのですが、ふと「そうだ、リマインド内容をテキストに書いといて、それをメモ帳で開けば、気付きやすいんじゃないか」とひらめき、実装してみたところ、良い感じでしたので採用しました。

### Q: パスを通すために Windows フォルダに置かせるのはひどくないか？
Ans: 他に良い方法がありません。

詳しい方なら、既にパスを通したフォルダがあるでしょうから、勝手にそこへ置けば良いと思います。

そうでない場合、パスを通したフォルダを準備させるのは手間なので、「元から通っているフォルダに入れればいい」という指示にしました。Windows フォルダという、システムフォルダに入れるのは行儀がよろしくありませんが、元から通っているフォルダが他にないので、仕方ありません。

### Q: コマンドプロンプトから r を実行すると、タイトルが書き換えられてしまうが、戻してくれないの？
Ans: 戻せません。ご了承ください。

タイトルを戻すためには、「コマンドプロンプトに現在表示されている内容を取得する手段」が必要になりますが、これが存在しません。もし存在するのなら、ぜひ教えてほしいです。r.bat に実装します。

## ライセンス
[MIT License](LICENSE)

## 作者
[stakiran](https://github.com/stakiran)
