# Quy Trình Khôi Phục Phiên Làm Việc

Dùng file này khi bắt đầu một phiên AI mới để khôi phục bối cảnh.

## Control Folder Chính

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL
```

Đây là bộ nhớ xuyên repo cho nỗ lực hợp nhất ABW x NVIDIA. Nó nằm ngoài cả hai repo source để tránh trộn source ngoài ý muốn.

## Thứ Tự Đọc

1. Tổng quan control:
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\README.md`
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\HANDOFF.md`
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\INTEGRATION_JOURNAL.md`

2. Roadmap và ràng buộc:
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\ROADMAP.md`
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\DECISIONS.md`
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\RISKS.md`
   - `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\repo-map.json`

3. Định hướng NVIDIA:
   - `D:\Sandbox\Nvidia\README.md`
   - `D:\Sandbox\Nvidia\.nvidia-agent\reports\audit-nvidia-abw-fusion-2026-04-30.md`

4. Định hướng ABW:
   - `D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md`
   - `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`

## Tóm Tắt Hiện Tại

- NVIDIA là product shell và active agent runtime.
- ABW là canonical governance engine và constitutional layer.
- Chiến lược tích hợp hiện tại là bridge-first.
- Không merge source trees cơ học.
- Không claim NVIDIA x ABW đã tích hợp nếu chưa có bridge và smoke check.
- Bắt đầu bằng CLI bridge; chỉ cân nhắc FastAPI/local service sau khi CLI bridge ổn định.

## Việc Tiếp Theo

Draft bridge contract:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\BRIDGE_CONTRACT.md
```

Sau đó quyết định có adopt:

```text
D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md
```

thành:

```text
D:\Sandbox\skill-Anti-brain-wiki_note\README.md
```

sau khi human review hay không.

## Prompt Khởi Đầu Phiên Mới

```text
Đọc `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\SESSION_RESTORE.md` trước, rồi làm theo thứ tự đọc trong file đó. Sau khi phục hồi bối cảnh, hãy tóm tắt trạng thái hiện tại, rủi ro chính, và việc nên làm tiếp theo trước khi sửa bất kỳ file nào.
```

