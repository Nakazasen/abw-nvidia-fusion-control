# ABW x NVIDIA Bridge Contract

Trạng thái: bản khung, chưa implement.

## Mục Tiêu

Định nghĩa contract tối thiểu để NVIDIA Agent Runtime gọi ABW Governance Engine mà không merge source code.

## Nguyên Tắc

- Bridge không được bypass Continuation Kernel.
- Bridge không được claim grounded/accepted nếu ABW trả về draft, pending, disputed, missing hoặc approval_required.
- Bridge phải giữ ranh giới repo:
  - NVIDIA code ở `D:\Sandbox\Nvidia`.
  - ABW code ở `D:\Sandbox\skill-Anti-brain-wiki_note`.
- Bridge bắt đầu bằng CLI. FastAPI/local service chỉ dùng sau khi CLI bridge ổn định.

## Phase 1: CLI Bridge

NVIDIA gọi ABW bằng command line.

Lệnh tối thiểu:

```powershell
abw version
abw doctor
abw ask "<prompt>"
abw review
```

Nếu chạy từ source local:

```powershell
cd D:\Sandbox\skill-Anti-brain-wiki_note
.\abw.bat version
.\abw.bat doctor
.\abw.bat ask "<prompt>"
```

## Trạng Thái Bắt Buộc Hiển Thị Cho UI

NVIDIA UI phải hiển thị rõ nếu ABW trả về:

- grounded,
- draft,
- pending_grounding,
- disputed,
- stale,
- missing,
- blocked,
- approval_required.

## Điều Kiện Stop

Bridge phải dừng và không tiếp tục execute nếu ABW báo:

- knowledge gap blocking,
- unsafe zone hard block,
- locked decision override thiếu approval,
- rollback contract không đủ an toàn,
- approval_required,
- no confident workspace,
- grounding backend unavailable nhưng request cần grounded answer.

## Việc Cần Thiết Kế Tiếp

- JSON output contract cho `abw ask`.
- Exit code contract.
- Mapping ABW status sang NVIDIA UI.
- Cách gắn ABW step id với pending diff.
- Cách ghi `.brain/step_history.jsonl` sau khi NVIDIA execute.

