# nix_sample

블로그의 [닉스로 하스켈 빌드 예시](https://lionhairdino.github.io/posts/2025-03-20-beginnerNix.html) 글에서 쓰인 샘플 코드입니다.

[NixOS.kr 디스코드](https://discord.gg/AMp9VYR44J)에 계신 분들의 도움을 받으며, 단계별(상황별)로 뼈대 혹은 템플릿으로 볼 수 있는 샘플 코드를 만들고 있습니다.

`/classic_nix`

- simplist : 가장 간단하게 `cabal init`이 생성한 간단한 프로젝트를 빌드합니다.
- simplist_zlib : Nixpkgs에 찾을 수 있는 `zlib`에 의존하는 간단한 프로젝트를 빌드합니다.
- simplist_libfoo : 현재 프로젝트에서만 쓰일 c라이브러리에 의존하는 프로젝트를 빌드합니다.

루트 폴더의 아래 샘플들은 Flake와 `cabal2nix`를 활용한 예시입니다.

- simplist
- simplist_zlib
- simplist_libfoo
