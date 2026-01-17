# AI-Corp Technical Reference & Foundation
Based on: "Claude Code Organization" methodology by Akira-Papa & Daikon.

## 1. 参照リソース (Source Material)
本プロジェクトは、以下のリポジトリおよび解説動画の実装手法をベースラインとして採用する。

* **Primary Source (Video):**
    * Title: 【AI組織実現‼️Claude Code Organization】現役エンジニアが「5人のAIが勝手に開発する会社」の作り方を解説！
    * URL: `https://youtu.be/Qxus36eijkM`
* **Target Repositories (GitHub):**
    * AIエージェントは以下のキーワードまたはURL構造で検索・参照し、最新のコードベースを確認すること。
    * **Base Repo (Akira-Papa fork):** `https://github.com/aki-ras/claude-code-communication` (※URLは推測を含むため、`Akira-Papa claude-code` で検索して特定すること)
    * **Original Repo (Daikon):** `daikon-p/claude-code-communication` (または類似の名称)
    * *Note:* これらのリポジトリに含まれる `setup.sh`, `prompts/`, `.tmux.conf` の設定ロジックを継承する。

## 2. コア・アーキテクチャ (Core Architecture)

### 2.1. tmux構成と操作性 (UI/UX)
動画内で強調されている「操作性の確保」は必須要件である。以下の設定を `.tmux.conf` に適用し、多画面運用時の生産性を担保する。

```tmux
# .tmux.conf essential settings
# マウス操作を有効化（ペイン移動、リサイズ用）
set-option -g mouse on

# キーバインド設定（画面分割の効率化）
bind | split-window -h
bind - split-window -v
```
