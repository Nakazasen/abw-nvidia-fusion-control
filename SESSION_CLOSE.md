# Quy Trình Kết Thúc Phiên Làm Việc

Dùng file này trước khi kết thúc một phiên AI để lưu lại đầy đủ bối cảnh cho lần sau.

## Prompt Kết Thúc Phiên

```text
Trước khi kết thúc phiên, hãy cập nhật bộ nhớ điều phối tại:
`D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`

Yêu cầu:
1. Đọc lại:
   - `SESSION_RESTORE.md`
   - `HANDOFF.md`
   - `INTEGRATION_JOURNAL.md`
   - `ROADMAP.md`
   - `DECISIONS.md`
   - `RISKS.md`
   - `FILE_INDEX.md`
2. Tóm tắt việc đã làm trong phiên này.
3. Ghi thêm entry mới vào `INTEGRATION_JOURNAL.md` với ngày hiện tại.
4. Cập nhật `HANDOFF.md`:
   - trạng thái hiện tại,
   - file đã tạo/sửa,
   - việc đang dang dở,
   - việc nên làm ngay phiên sau.
5. Cập nhật `ROADMAP.md` nếu có thay đổi ưu tiên.
6. Cập nhật `DECISIONS.md` nếu có quyết định kiến trúc mới.
7. Cập nhật `RISKS.md` nếu phát hiện rủi ro mới hoặc mitigation mới.
8. Cập nhật `FILE_INDEX.md` nếu có file điều phối mới.
9. Không sửa source repo NVIDIA hoặc ABW nếu nhiệm vụ chỉ là lưu phiên.
10. Sau khi cập nhật, báo lại danh sách file đã sửa và prompt khởi đầu phiên sau.
```

## Checklist Lưu Phiên

- [ ] `INTEGRATION_JOURNAL.md` có entry mới.
- [ ] `HANDOFF.md` phản ánh trạng thái mới nhất.
- [ ] `ROADMAP.md` không còn next step cũ đã hoàn thành.
- [ ] `DECISIONS.md` có quyết định mới nếu phát sinh.
- [ ] `RISKS.md` có rủi ro mới nếu phát sinh.
- [ ] `FILE_INDEX.md` có đủ file điều phối.
- [ ] Prompt khởi đầu phiên sau vẫn trỏ về `SESSION_RESTORE.md`.

