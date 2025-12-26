% =====================================================
% HỆ CHUYÊN GIA TƯ VẤN MUA LAPTOP
% =====================================================
% Tác giả: AI Assistant
% Mô tả: Hệ thống tư vấn thông minh giúp người dùng chọn laptop phù hợp
% =====================================================

:- dynamic user_need/1, user_budget/1, user_preference/2, asked/1.

% =====================================================
% CƠ SỞ TRI THỨC VỀ LAPTOP
% =====================================================

% laptop(Tên, Hãng, Giá, CPU, RAM, Ổ_cứng, Card_đồ_họa, Màn_hình, Trọng_lượng, Pin)
laptop('MSI GF63', msi, 15000000, 'Intel Core i5-11500h', 8, 512, 'RTX 2050', 15.6, 2.1, 5).
laptop('Dell lalitude', dell, 10000000, 'Intel Core i5-1335U', 8, 512, 'Intel Iris Xe', 14, 1.25, 12).
laptop('MacBook Air M2', apple, 28000000, 'Apple M2', 8, 256, 'M2 8-core', 13.6, 1.24, 18).
laptop('MacBook Pro 14 M3', apple, 45000000, 'Apple M3 Pro', 18, 512, 'M3 Pro 14-core', 14.2, 1.55, 17).
laptop('Dell XPS 13', dell, 25000000, 'Intel Core i7-1355U', 16, 512, 'Intel Iris Xe', 13.4, 1.19, 12).
laptop('Dell XPS 15', dell, 42000000, 'Intel Core i7-13700H', 32, 1000, 'NVIDIA RTX 4050', 15.6, 1.86, 10).
laptop('Lenovo ThinkPad X1 Carbon', lenovo, 35000000, 'Intel Core i7-1365U', 16, 512, 'Intel Iris Xe', 14, 1.12, 15).
laptop('Lenovo Legion 5 Pro', lenovo, 38000000, 'AMD Ryzen 7 7745HX', 16, 512, 'NVIDIA RTX 4060', 16, 2.5, 6).
laptop('ASUS ZenBook 14', asus, 22000000, 'Intel Core i5-1335U', 16, 512, 'Intel Iris Xe', 14, 1.39, 14).
laptop('ASUS ROG Strix G16', asus, 45000000, 'Intel Core i9-13980HX', 32, 1000, 'NVIDIA RTX 4070', 16, 2.6, 5).
laptop('HP Envy 13', hp, 23000000, 'Intel Core i7-1355U', 16, 512, 'Intel Iris Xe', 13.3, 1.3, 13).
laptop('HP Pavilion Gaming', hp, 27000000, 'AMD Ryzen 5 7535HS', 16, 512, 'NVIDIA RTX 3050', 15.6, 2.29, 7).
laptop('Acer Swift 3', acer, 18000000, 'Intel Core i5-1335U', 8, 512, 'Intel Iris Xe', 14, 1.25, 12).
laptop('Acer Predator Helios 300', acer, 35000000, 'Intel Core i7-13700H', 16, 512, 'NVIDIA RTX 4060', 15.6, 2.5, 6).
laptop('MSI Prestige 14', msi, 30000000, 'Intel Core i7-1360P', 16, 512, 'Intel Iris Xe', 14, 1.29, 14).
laptop('MSI Katana 15', msi, 25000000, 'Intel Core i5-12450H', 8, 512, 'NVIDIA RTX 3050', 15.6, 2.25, 6).
laptop('LG Gram 17', lg, 38000000, 'Intel Core i7-1360P', 16, 512, 'Intel Iris Xe', 17, 1.35, 19).

% =====================================================
% QUY TẮC XÁC ĐỊNH MỤC ĐÍCH SỬ DỤNG
% =====================================================

% Mục đích sử dụng chính
purpose(office_work) :- 
    user_need(van_phong).
    
purpose(programming) :- 
    user_need(lap_trinh).
    
purpose(design) :- 
    user_need(thiet_ke).
    
purpose(gaming) :- 
    user_need(choi_game).
    
purpose(video_editing) :- 
    user_need(dung_video).
    
purpose(student) :- 
    user_need(hoc_tap).
    
purpose(business_travel) :- 
    user_need(cong_tac).

% =====================================================
% QUY TẮC ĐÁNH GIÁ ĐỘ PHÙ HỢP
% =====================================================

% Kiểm tra ngân sách
within_budget(LaptopName) :-
    laptop(LaptopName, _, Price, _, _, _, _, _, _, _),
    user_budget(Budget),
    Price =< Budget * 1.1. % Cho phép vượt 10%

% Đánh giá độ phù hợp với văn phòng
suitable_for_office(LaptopName, Score) :-
    laptop(LaptopName, _, _, _, RAM, Storage, _, Screen, Weight, Battery),
    (RAM >= 8 -> S1 = 20 ; S1 = 0),
    (Storage >= 256 -> S2 = 15 ; S2 = 0),
    (Weight =< 1.5 -> S3 = 25 ; Weight =< 2.0 -> S3 = 15 ; S3 = 5),
    (Battery >= 10 -> S4 = 25 ; Battery >= 8 -> S4 = 15 ; S4 = 5),
    (Screen =< 14 -> S5 = 15 ; S5 = 10),
    Score is S1 + S2 + S3 + S4 + S5.

% Đánh giá độ phù hợp với lập trình
suitable_for_programming(LaptopName, Score) :-
    laptop(LaptopName, _, _, CPU, RAM, Storage, _, Screen, _, Battery),
    (RAM >= 16 -> S1 = 30 ; RAM >= 8 -> S1 = 15 ; S1 = 5),
    (Storage >= 512 -> S2 = 20 ; S2 = 10),
    (member(CPU, ['Apple M2', 'Apple M3 Pro', 'Intel Core i7-1365U', 'Intel Core i7-1355U', 'Intel Core i7-13700H', 'AMD Ryzen 7 7745HX', 'Intel Core i9-13980HX','i5-11500h']) -> S3 = 25 ; S3 = 10),
    (Screen >= 13, Screen =< 15.6 -> S4 = 15 ; S4 = 5),
    (Battery >= 10 -> S5 = 10 ; S5 = 5),
    Score is S1 + S2 + S3 + S4 + S5.

% Đánh giá độ phù hợp với thiết kế đồ họa
suitable_for_design(LaptopName, Score) :-
    laptop(LaptopName, _, _, _, RAM, Storage, GPU, Screen, _, _),
    (RAM >= 16 -> S1 = 25 ; S1 = 0),
    (Storage >= 512 -> S2 = 15 ; S2 = 5),
    (sub_string(GPU, _, _, _, "RTX") ; sub_string(GPU, _, _, _, "M2") ; sub_string(GPU, _, _, _, "M3") -> S3 = 35 ; S3 = 5),
    (Screen >= 14 -> S4 = 15 ; S4 = 5),
    (Screen >= 15 -> S5 = 10 ; S5 = 0),
    Score is S1 + S2 + S3 + S4 + S5.

% Đánh giá độ phù hợp với gaming
suitable_for_gaming(LaptopName, Score) :-
    laptop(LaptopName, _, _, _, RAM, Storage, GPU, Screen, _, _),
    (RAM >= 16 -> S1 = 25 ; RAM >= 8 -> S1 = 10 ; S1 = 0),
    (Storage >= 512 -> S2 = 15 ; S2 = 5),
    (sub_string(GPU, _, _, _, "RTX 4070") -> S3 = 40 ; 
     sub_string(GPU, _, _, _, "RTX 4060") -> S3 = 35 ;
     sub_string(GPU, _, _, _, "RTX 4050") -> S3 = 30 ;
     sub_string(GPU, _, _, _, "RTX 3050") -> S3 = 20 ;
     sub_string(GPU, _, _, _, "RTX 2050") -> S3 = 15 ;
     S3 = 0),
    (Screen >= 15.6 -> S4 = 20 ; S4 = 5),
    Score is S1 + S2 + S3 + S4.

% Đánh giá độ phù hợp với chỉnh sửa video
suitable_for_video_editing(LaptopName, Score) :-
    laptop(LaptopName, _, _, CPU, RAM, Storage, GPU, Screen, _, _),
    (RAM >= 32 -> S1 = 30 ; RAM >= 16 -> S1 = 20 ; S1 = 5),
    (Storage >= 1000 -> S2 = 20 ; Storage >= 512 -> S2 = 10 ; S2 = 5),
    (sub_string(GPU, _, _, _, "RTX") ; sub_string(GPU, _, _, _, "M3 Pro") -> S3 = 30 ; S3 = 5),
    (member(CPU, ['Apple M3 Pro', 'Intel Core i9-13980HX', 'Intel Core i7-13700H', 'AMD Ryzen 7 7745HX']) -> S4 = 15 ; S4 = 5),
    (Screen >= 15 -> S5 = 5 ; S5 = 0),
    Score is S1 + S2 + S3 + S4 + S5.

% Đánh giá độ phù hợp cho học sinh - sinh viên
suitable_for_student(LaptopName, Score) :-
    laptop(LaptopName, _, Price, _, RAM, Storage, _, _, Weight, Battery),
    (Price =< 25000000 -> S1 = 25 ; Price =< 30000000 -> S1 = 15 ; S1 = 5),
    (RAM >= 8 -> S2 = 20 ; S2 = 5),
    (Storage >= 256 -> S3 = 15 ; S3 = 5),
    (Weight =< 1.5 -> S4 = 25 ; Weight =< 2.0 -> S4 = 15 ; S4 = 5),
    (Battery >= 12 -> S5 = 15 ; Battery >= 8 -> S5 = 10 ; S5 = 5),
    Score is S1 + S2 + S3 + S4 + S5.

% Đánh giá độ phù hợp cho công tác
suitable_for_business_travel(LaptopName, Score) :-
    laptop(LaptopName, _, _, _, RAM, Storage, _, Screen, Weight, Battery),
    (Weight =< 1.3 -> S1 = 35 ; Weight =< 1.5 -> S1 = 25 ; Weight =< 1.8 -> S1 = 15 ; S1 = 5),
    (Battery >= 15 -> S2 = 30 ; Battery >= 12 -> S2 = 20 ; Battery >= 10 -> S2 = 10 ; S2 = 5),
    (RAM >= 16 -> S3 = 15 ; S3 = 10),
    (Storage >= 512 -> S4 = 10 ; S4 = 5),
    (Screen =< 14 -> S5 = 10 ; S5 = 5),
    Score is S1 + S2 + S3 + S4 + S5.

% =====================================================
% TÍNH ĐIỂM TỔNG HỢP
% =====================================================

calculate_score(LaptopName, TotalScore) :-
    (purpose(office_work) -> suitable_for_office(LaptopName, S1) ; S1 = 0),
    (purpose(programming) -> suitable_for_programming(LaptopName, S2) ; S2 = 0),
    (purpose(design) -> suitable_for_design(LaptopName, S3) ; S3 = 0),
    (purpose(gaming) -> suitable_for_gaming(LaptopName, S4) ; S4 = 0),
    (purpose(video_editing) -> suitable_for_video_editing(LaptopName, S5) ; S5 = 0),
    (purpose(student) -> suitable_for_student(LaptopName, S6) ; S6 = 0),
    (purpose(business_travel) -> suitable_for_business_travel(LaptopName, S7) ; S7 = 0),
    TotalScore is max(S1, max(S2, max(S3, max(S4, max(S5, max(S6, S7)))))).

% =====================================================
% TÌM KIẾM VÀ XẾP HẠNG
% =====================================================

% Tìm tất cả laptop phù hợp
find_suitable_laptops(SuitableLaptops) :-
    findall(Score-LaptopName, 
            (laptop(LaptopName, _, _, _, _, _, _, _, _, _), 
             within_budget(LaptopName),
             calculate_score(LaptopName, Score),
             Score > 50),
            Laptops),
    sort(0, @>=, Laptops, SuitableLaptops).

% =====================================================
% HIỂN THỊ THÔNG TIN
% =====================================================

display_laptop_info(LaptopName) :-
    laptop(LaptopName, Brand, Price, CPU, RAM, Storage, GPU, Screen, Weight, Battery),
    format('~n╔════════════════════════════════════════════════════════════════════╗~n', []),
    format('║  ~w~*+~w║~n', [LaptopName, 66, ' ']),
    format('╠════════════════════════════════════════════════════════════════════╣~n', []),
    format('║  Hãng:           ~w~*+~w║~n', [Brand, 51, ' ']),
    format('║  Giá:            ~:d VNĐ~*+~w║~n', [Price, 40, ' ']),
    format('║  CPU:            ~w~*+~w║~n', [CPU, 51, ' ']),
    format('║  RAM:            ~w GB~*+~w║~n', [RAM, 53, ' ']),
    format('║  Ổ cứng:         ~w GB SSD~*+~w║~n', [Storage, 48, ' ']),
    format('║  Card đồ họa:    ~w~*+~w║~n', [GPU, 51, ' ']),
    format('║  Màn hình:       ~w inch~*+~w║~n', [Screen, 50, ' ']),
    format('║  Trọng lượng:    ~w kg~*+~w║~n', [Weight, 51, ' ']),
    format('║  Pin:            ~w giờ~*+~w║~n', [Battery, 51, ' ']),
    format('╚════════════════════════════════════════════════════════════════════╝~n', []).

% Giải thích lý do đề xuất
explain_recommendation(LaptopName) :-
    laptop(LaptopName, _, Price, CPU, RAM, Storage, GPU, Screen, Weight, Battery),
    write('\n🔍 LÝ DO ĐỀ XUẤT:\n'),
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'),
    
    % Giải thích theo mục đích
    (purpose(office_work) -> 
        format('✓ Phù hợp cho văn phòng: RAM ~w GB, trọng lượng ~w kg, pin ~w giờ~n', [RAM, Weight, Battery]) ; true),
    (purpose(programming) -> 
        format('✓ Tốt cho lập trình: CPU ~w, RAM ~w GB, ổ cứng ~w GB~n', [CPU, RAM, Storage]) ; true),
    (purpose(design) -> 
        format('✓ Mạnh mẽ cho thiết kế: RAM ~w GB, GPU ~w, màn hình ~w inch~n', [RAM, GPU, Screen]) ; true),
    (purpose(gaming) -> 
        format('✓ Chiến game mượt: GPU ~w, RAM ~w GB, màn hình ~w inch~n', [GPU, RAM, Screen]) ; true),
    (purpose(video_editing) -> 
        format('✓ Xuất sắc cho dựng video: CPU ~w, RAM ~w GB, GPU ~w~n', [CPU, RAM, GPU]) ; true),
    (purpose(student) -> 
        format('✓ Phù hợp sinh viên: Giá ~:d VNĐ, nhẹ ~w kg, pin ~w giờ~n', [Price, Weight, Battery]) ; true),
    (purpose(business_travel) -> 
        format('✓ Tuyệt vời cho công tác: Siêu nhẹ ~w kg, pin lâu ~w giờ~n', [Weight, Battery]) ; true),
    
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n').

% =====================================================
% GIAO DIỆN NGƯỜI DÙNG
% =====================================================

% Reset dữ liệu
reset :-
    retractall(user_need(_)),
    retractall(user_budget(_)),
    retractall(user_preference(_, _)),
    retractall(asked(_)).

% Hỏi mục đích sử dụng
ask_purpose :-
    write('\n╔════════════════════════════════════════════════════════════════════╗\n'),
    write('║         HỆ CHUYÊN GIA TƯ VẤN MUA LAPTOP                          ║\n'),
    write('╚════════════════════════════════════════════════════════════════════╝\n'),
    write('\n📋 BẠN MUỐN SỬ DỤNG LAPTOP CHỦ YẾU ĐỂ LÀM GÌ?\n'),
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'),
    write('1. Công việc văn phòng (Office, Email, Web)\n'),
    write('2. Lập trình (Coding, Development)\n'),
    write('3. Thiết kế đồ họa (Photoshop, Illustrator)\n'),
    write('4. Chơi game\n'),
    write('5. Dựng video (Premiere, After Effects)\n'),
    write('6. Học tập (cho học sinh, sinh viên)\n'),
    write('7. Công tác (Di chuyển nhiều, cần nhẹ)\n'),
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'),
    write('👉 Nhập số (1-7): '),
    read(Choice),
    process_purpose_choice(Choice).

process_purpose_choice(1) :- assert(user_need(van_phong)).
process_purpose_choice(2) :- assert(user_need(lap_trinh)).
process_purpose_choice(3) :- assert(user_need(thiet_ke)).
process_purpose_choice(4) :- assert(user_need(choi_game)).
process_purpose_choice(5) :- assert(user_need(dung_video)).
process_purpose_choice(6) :- assert(user_need(hoc_tap)).
process_purpose_choice(7) :- assert(user_need(cong_tac)).
process_purpose_choice(_) :- 
    write('❌ Lựa chọn không hợp lệ!\n'),
    ask_purpose.

% Hỏi ngân sách
ask_budget :-
    write('\n💰 NGÂN SÁCH CỦA BẠN LÀ BAO NHIÊU?\n'),
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'),
    write('1. Dưới 20 triệu VNĐ\n'),
    write('2. 20-30 triệu VNĐ\n'),
    write('3. 30-40 triệu VNĐ\n'),
    write('4. Trên 40 triệu VNĐ\n'),
    write('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'),
    write('👉 Nhập số (1-4): '),
    read(Choice),
    process_budget_choice(Choice).

process_budget_choice(1) :- assert(user_budget(20000000)).
process_budget_choice(2) :- assert(user_budget(30000000)).
process_budget_choice(3) :- assert(user_budget(40000000)).
process_budget_choice(4) :- assert(user_budget(50000000)).
process_budget_choice(_) :- 
    write('❌ Lựa chọn không hợp lệ!\n'),
    ask_budget.

% Hiển thị kết quả
show_recommendations :-
    write('\n\n🔎 ĐANG TÌM KIẾM LAPTOP PHÙ HỢP...\n'),
    find_suitable_laptops(Laptops),
    (Laptops = [] ->
        write('\n❌ Rất tiếc! Không tìm thấy laptop phù hợp với yêu cầu của bạn.\n'),
        write('💡 Gợi ý: Hãy thử tăng ngân sách hoặc điều chỉnh yêu cầu.\n')
    ;
        write('\n✨ TÌM THẤY CÁC LAPTOP PHÙ HỢP:\n'),
        show_top_recommendations(Laptops, 1)
    ).

show_top_recommendations([], _).
show_top_recommendations([Score-LaptopName|Rest], Index) :-
    Index =< 3, % Chỉ hiển thị top 3
    format('~n~n━━━━━━━━━━━━━━━━━━━━━━━ GỢI Ý #~w (Điểm: ~w/100) ━━━━━━━━━━━━━━━━━━━━━━━~n', [Index, Score]),
    display_laptop_info(LaptopName),
    explain_recommendation(LaptopName),
    NextIndex is Index + 1,
    show_top_recommendations(Rest, NextIndex).
show_top_recommendations(_, Index) :- Index > 3.

% =====================================================
% CHẠY HỆ THỐNG
% =====================================================

start :-
    reset,
    ask_purpose,
    ask_budget,
    show_recommendations,
    write('\n\n╔════════════════════════════════════════════════════════════════════╗\n'),
    write('║  CẢM ƠN BẠN ĐÃ SỬ DỤNG HỆ CHUYÊN GIA TƯ VẤN LAPTOP!            ║\n'),
    write('║  Chúc bạn tìm được chiếc laptop ưng ý! 🎉                        ║\n'),
    write('╚════════════════════════════════════════════════════════════════════╝\n\n').

% Hướng dẫn sử dụng
help :-
    write('\n╔════════════════════════════════════════════════════════════════════╗\n'),
    write('║              HƯỚNG DẪN SỬ DỤNG HỆ THỐNG                          ║\n'),
    write('╠════════════════════════════════════════════════════════════════════╣\n'),
    write('║  Để bắt đầu tư vấn, gõ:    start.                                ║\n'),
    write('║  Để xem hướng dẫn, gõ:     help.                                 ║\n'),
    write('║  Để reset hệ thống, gõ:    reset.                                ║\n'),
    write('╚════════════════════════════════════════════════════════════════════╝\n\n').

% =====================================================
% HIỂN THỊ THÔNG BÁO KHI LOAD FILE
% =====================================================

:- initialization(help).