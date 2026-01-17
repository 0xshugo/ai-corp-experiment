# AI-Corp Genesis: Autonomous AI Organization on tmux

![License](https://img.shields.io/badge/license-MIT-blue.svg) ![Status](https://img.shields.io/badge/status-experimental-orange.svg)

**AI-Corp Genesis** は、Linuxターミナル多重化ソフトウェア `tmux` と `Claude Code` を組み合わせ、VPS上に「自律的に協調動作する擬似的な企業組織」を構築するための実験的フレームワークです。

各 `tmux` ウィンドウを「部署」、ペインを「社員」に見立て、ファイルベースの非同期通信によって、CEO、PM、エンジニア、法務担当などのAIエージェントが連携してプロジェクトを推進します。

## 🏗 Architecture

### 組織構造 (The Organization)
tmuxのセッション内で、以下の役割を持つAIエージェントが常駐します。

* **Window 0: HQ (経営戦略室)**
    * **CEO:** 全体指揮、プロンプト発行、予算管理
    * **COO:** 整合性チェック、進捗監視
* **Window 1: Dev (技術開発部)**
    * **PM:** 技術仕様策定
    * **Engineers:** フロントエンド/バックエンド実装
* **Window 2: Admin (管理部)**
    * **Legal:** コンプライアンス・利用規約チェック
    * **Knowledge:** 社内Wiki (Obsidian等) の整備
* **Window 3: Marketing (広報)**
    * **PR:** 広報記事作成、市場調査

### 通信プロトコル (Communication)
エージェント間の会話はチャットツールではなく、**ファイルシステム**を介して行われます。

CEO Agent -> Write Instruction -> ./communication/inbox/ -> Read Task -> Dev Agent -> Write Code/Artifact -> ./data/ -> Report Completion -> ./communication/archive/ -> Notify CEO

## 📂 File Structure

```text
.
├── MASTER_PLAN.md        # AI組織の全体設計図・憲法
├── TECHNICAL_REFERENCE.md # 技術仕様書（AIに読み込ませる用）
├── ai-corp/
│   ├── .tmux.conf        # 画面分割設定
│   ├── prompts/          # 各ロールのシステムプロンプト定義
│   └── boot_corp.sh      # (Optional) 自動起動スクリプト
├── communication/        # メッセージキュー (Git対象外)
└── data/                 # 成果物 (Git対象外)
```
