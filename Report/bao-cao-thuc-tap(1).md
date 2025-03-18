# 2. BÁO CÁO THỰC TẬP

## 2.1. Giới thiệu về công ty

CESLAB (Computer Embedded Systems Laboratory) là phòng thí nghiệm trực thuộc Khoa Điện tử - Viễn thông (FETEL) của Trường Đại học Khoa học Tự nhiên (HCMUS), Đại học Quốc gia Thành phố Hồ Chí Minh (VNUHCM). Phòng thí nghiệm được đặt dưới sự quản lý của TS. Huỳnh Hữu Thuận - Trưởng Bộ môn Máy tính và Hệ thống Nhúng, đồng thời là người hướng dẫn thực tập của tôi trong đợt thực tập này.

CESLAB được thành lập với mục tiêu trở thành một trung tâm hàng đầu trong nghiên cứu, phát triển và đào tạo về hệ thống nhúng tại Việt Nam. Phòng thí nghiệm đóng vai trò quan trọng trong việc kết nối giữa lý thuyết học thuật và ứng dụng thực tiễn, đồng thời là nơi đào tạo nguồn nhân lực chất lượng cao trong lĩnh vực điện tử và hệ thống nhúng.

Khoa Điện tử - Viễn thông (FETEL) của Trường Đại học Khoa học Tự nhiên là một trong những khoa đào tạo hàng đầu về lĩnh vực điện tử, viễn thông và công nghệ thông tin tại Việt Nam. Khoa có lịch sử phát triển lâu dài và được trang bị cơ sở vật chất hiện đại, đáp ứng nhu cầu đào tạo và nghiên cứu. Với đội ngũ giảng viên có trình độ chuyên môn cao và kinh nghiệm thực tiễn FETEL không ngừng đổi mới chương trình đào tạo, nâng cao chất lượng giảng dạy và nghiên cứu khoa học.

CESLAB tập trung vào các lĩnh vực chính như:
- Nghiên cứu và phát triển các hệ thống nhúng
- Thiết kế và tối ưu hóa các hệ thống SoC (System-on-Chip)
- Phát triển phần mềm và phần cứng cho các ứng dụng nhúng
- Ứng dụng FPGA trong các hệ thống thời gian thực
- Phát triển các giải pháp IoT và các hệ thống thông minh
- Nghiên cứu và phát triển các giải pháp xử lý tín hiệu số

Phòng thí nghiệm được trang bị các thiết bị hiện đại và các công cụ phát triển chuyên nghiệp, cung cấp môi trường làm việc lý tưởng cho các kỹ sư và sinh viên thực tập. CESLAB cũng thường xuyên hợp tác với các trường đại học và doanh nghiệp trong và ngoài nước để thực hiện các dự án nghiên cứu và phát triển, tạo cơ hội cho sinh viên được tiếp xúc với các công nghệ mới và môi trường làm việc chuyên nghiệp.

## 2.2. Nội dung thực tập

Trong thời gian thực tập tại CESLAB, tôi đã được giao nhiệm vụ nghiên cứu và phát triển một hệ thống truyền dữ liệu sử dụng DMA (Direct Memory Access) giữa hai bộ nhớ on-chip trên bộ xử lý Nios II. Dự án này có ý nghĩa quan trọng trong việc tối ưu hóa hiệu suất truyền dữ liệu trong các hệ thống nhúng, đặc biệt là trong các ứng dụng đòi hỏi xử lý dữ liệu tốc độ cao.

### 2.2.1. Tổng quan về công nghệ sử dụng

#### Board DE10-Standard
Board DE10-Standard là một nền tảng phát triển FPGA do Intel (trước đây là Altera) sản xuất, được thiết kế chuyên biệt cho các ứng dụng giáo dục và nghiên cứu. Board này được trang bị chip FPGA Cyclone V SoC, kết hợp giữa FPGA và bộ xử lý ARM Cortex-A9 dual-core. DE10-Standard cung cấp nhiều tài nguyên phần cứng như các cổng GPIO, SDRAM, bộ nhớ flash, cổng kết nối mạng, HDMI, VGA, và nhiều cổng mở rộng khác, giúp cho việc phát triển các ứng dụng nhúng đa dạng và phức tạp trở nên dễ dàng hơn.

#### Verilog HDL
Verilog là một ngôn ngữ mô tả phần cứng (HDL - Hardware Description Language) được sử dụng rộng rãi trong việc thiết kế và mô phỏng các mạch số. Ngôn ngữ này cho phép mô tả cấu trúc và hành vi của các mạch điện tử ở các mức độ trừu tượng khác nhau, từ cấp độ cổng logic đến cấp độ hệ thống. Trong dự án này, Verilog được sử dụng để mô tả các thành phần phần cứng tùy chỉnh như bộ điều khiển DMA và các giao diện bộ nhớ.

#### Intel Quartus Prime Lite
Intel Quartus Prime Lite là một phần mềm phát triển tích hợp (IDE) miễn phí được cung cấp bởi Intel dành cho việc thiết kế, phân tích và tổng hợp các thiết kế FPGA. Phần mềm này hỗ trợ nhiều tính năng như thiết kế sơ đồ khối, mã hóa HDL, phân tích thời gian, và lập trình thiết bị, giúp cho quá trình phát triển trở nên hiệu quả và dễ dàng hơn. Trong dự án này, Quartus Prime Lite được sử dụng để phát triển và tổng hợp thiết kế FPGA, cũng như để lập trình cho board DE10-Standard.

#### QuestaSim (ModelSim)
QuestaSim (trước đây là ModelSim) là một công cụ mô phỏng HDL mạnh mẽ được sử dụng để mô phỏng và debug các thiết kế phần cứng. Công cụ này cho phép mô phỏng các mô hình Verilog, VHDL hoặc các mô hình hỗn hợp, và cung cấp các tính năng phân tích như theo dõi tín hiệu, kiểm tra thời gian, và phân tích hiệu suất. Trong dự án này, QuestaSim được sử dụng để mô phỏng và kiểm tra chức năng của bộ điều khiển DMA và các thành phần liên quan trước khi triển khai thực tế.

#### Platform Designer (trước đây là Qsys)
Platform Designer là một công cụ trong bộ công cụ Intel Quartus Prime được sử dụng để tạo và quản lý các hệ thống SoC (System-on-Chip). Công cụ này cho phép kết nối các thành phần IP (Intellectual Property) thông qua một giao diện đồ họa, giúp cho việc thiết kế hệ thống trở nên trực quan và hiệu quả. Platform Designer hỗ trợ các giao thức truyền thông chuẩn như Avalon, AXI, và APB, và tự động tạo ra các logic kết nối giữa các thành phần. Trong dự án này, Platform Designer được sử dụng để tích hợp bộ xử lý Nios II, bộ nhớ on-chip, và bộ điều khiển DMA vào một hệ thống SoC hoàn chỉnh.

#### Nios II Processor
Nios II là một bộ xử lý soft-core 32-bit có thể được tích hợp vào các thiết bị FPGA của Intel. Bộ xử lý này có kiến trúc RISC (Reduced Instruction Set Computer) và có thể được tùy chỉnh để đáp ứng các yêu cầu cụ thể của ứng dụng. Nios II hỗ trợ nhiều tính năng như bộ nhớ cache, đơn vị quản lý bộ nhớ (MMU), và các giao diện ngoại vi, giúp cho việc phát triển các ứng dụng nhúng trở nên linh hoạt và hiệu quả. Trong dự án này, bộ xử lý Nios II được sử dụng làm bộ xử lý chính của hệ thống, chịu trách nhiệm điều khiển các hoạt động truyền dữ liệu DMA.

#### SoC (System-on-Chip)
SoC là một kỹ thuật tích hợp các thành phần của một hệ thống máy tính hoặc hệ thống điện tử khác vào một chip duy nhất. Một SoC có thể bao gồm bộ xử lý, bộ nhớ, giao diện ngoại vi, và các thành phần khác, tạo thành một hệ thống hoàn chỉnh. Trong dự án này, một SoC được phát triển trên FPGA bao gồm bộ xử lý Nios II, bộ nhớ on-chip, và bộ điều khiển DMA, tạo thành một hệ thống nhúng hoàn chỉnh.

#### On-chip Memory
Bộ nhớ on-chip là bộ nhớ được tích hợp trực tiếp trên chip FPGA, có thời gian truy cập nhanh và băng thông cao. Trong dự án này, hai khối bộ nhớ on-chip được sử dụng làm nguồn và đích cho việc truyền dữ liệu DMA. Việc sử dụng bộ nhớ on-chip giúp giảm thiểu độ trễ và tối ưu hóa hiệu suất truyền dữ liệu.

Các nội dung chính của quá trình thực tập bao gồm:

1. **Nghiên cứu lý thuyết về DMA và bộ xử lý Nios II**
   - Tìm hiểu về cơ chế hoạt động của DMA
   - Nghiên cứu kiến trúc và các thành phần của bộ xử lý Nios II
   - Tìm hiểu về cấu trúc bộ nhớ on-chip và các cơ chế truy cập bộ nhớ

2. **Thiết kế hệ thống**
   - Phân tích yêu cầu hệ thống và xác định các thông số kỹ thuật
   - Thiết kế kiến trúc hệ thống bao gồm bộ điều khiển DMA và các thành phần liên quan
   - Xây dựng mô hình mô phỏng để kiểm tra tính khả thi của thiết kế

3. **Triển khai hệ thống**
   - Cấu hình và tùy chỉnh bộ xử lý Nios II để hỗ trợ DMA
   - Phát triển driver cho bộ điều khiển DMA
   - Viết mã để thiết lập và quản lý các hoạt động truyền dữ liệu

4. **Kiểm thử và tối ưu hóa**
   - Phát triển các bộ kiểm thử để đánh giá hiệu suất truyền dữ liệu
   - Đo lường và phân tích hiệu suất của hệ thống
   - Tối ưu hóa các tham số hệ thống để cải thiện hiệu suất

5. **Tài liệu hóa và báo cáo**
   - Phát triển tài liệu kỹ thuật chi tiết về hệ thống
   - Chuẩn bị báo cáo và thuyết trình về kết quả của dự án

Trong quá trình thực tập, tôi đã được làm việc dưới sự hướng dẫn trực tiếp của TS. Huỳnh Hữu Thuận - Trưởng Bộ môn Máy tính và Hệ thống Nhúng, cùng với các chuyên gia có kinh nghiệm trong lĩnh vực hệ thống nhúng tại CESLAB. Tôi đã có cơ hội áp dụng những kiến thức lý thuyết đã học tại trường vào thực tiễn, đồng thời tiếp cận với các công nghệ và phương pháp nghiên cứu mới trong môi trường học thuật chuyên nghiệp.

## 2.3. Kết quả đạt được

### 2.3.1. Về kiến thức

Qua quá trình thực tập tại CESLAB, tôi đã đạt được những kiến thức chuyên môn sau:

- **Kiến thức chuyên sâu về bộ xử lý Nios II**: Hiểu rõ về kiến trúc, cách thức hoạt động và các thành phần chính của bộ xử lý Nios II. Nắm vững cách cấu hình và tùy chỉnh bộ xử lý cho các ứng dụng cụ thể.

- **Hiểu biết về DMA và cơ chế truyền dữ liệu**: Hiểu rõ về cơ chế hoạt động của DMA, các loại truyền dữ liệu và các phương pháp tối ưu hóa hiệu suất truyền dữ liệu.

- **Kiến thức về thiết kế hệ thống nhúng**: Nắm vững các nguyên tắc thiết kế hệ thống nhúng, cách tổ chức và quản lý bộ nhớ, cũng như các kỹ thuật tối ưu hóa hiệu suất.

- **Hiểu biết về lập trình nhúng**: Phát triển kỹ năng lập trình cho hệ thống nhúng, bao gồm lập trình driver, lập trình giao tiếp với phần cứng và xử lý các vấn đề về đồng bộ hóa.

- **Kiến thức về các công cụ phát triển**: Làm quen với các công cụ phát triển phần cứng và phần mềm cho hệ thống nhúng, bao gồm Quartus Prime, ModelSim, và các công cụ phát triển phần mềm cho Nios II.

### 2.3.2. Về kỹ năng

Ngoài những kiến thức chuyên môn, tôi cũng đã phát triển và cải thiện nhiều kỹ năng quan trọng:

- **Kỹ năng phân tích và giải quyết vấn đề**: Học được cách phân tích các vấn đề phức tạp, xác định nguyên nhân gốc rễ và đề xuất các giải pháp hiệu quả.

- **Kỹ năng lập trình và debug**: Cải thiện khả năng viết mã sạch, dễ bảo trì và có khả năng mở rộng. Phát triển kỹ năng debug hiệu quả để xác định và sửa lỗi trong hệ thống.

- **Kỹ năng thiết kế và tối ưu hóa hệ thống**: Học được cách thiết kế hệ thống đáp ứng các yêu cầu kỹ thuật và tối ưu hóa hiệu suất bằng cách điều chỉnh các tham số hệ thống.

- **Kỹ năng làm việc với các công cụ phát triển**: Thành thạo việc sử dụng các công cụ phát triển phần cứng và phần mềm cho hệ thống nhúng.

- **Kỹ năng làm việc nhóm**: Cải thiện khả năng làm việc hiệu quả trong một nhóm, chia sẻ kiến thức và hợp tác để giải quyết các vấn đề phức tạp.

- **Kỹ năng quản lý thời gian và dự án**: Học được cách lập kế hoạch, quản lý thời gian và theo dõi tiến độ của dự án để đảm bảo hoàn thành đúng hạn.

- **Kỹ năng trình bày và báo cáo**: Cải thiện khả năng trình bày ý tưởng và kết quả một cách rõ ràng, ngắn gọn và thuyết phục.

### 2.3.3. Về thái độ

Trong quá trình thực tập, tôi đã phát triển và thể hiện những thái độ tích cực sau:

- **Tinh thần học hỏi và cầu tiến**: Luôn giữ tâm thế sẵn sàng học hỏi kiến thức mới, chủ động tìm hiểu thêm về các công nghệ và kỹ thuật mới.

- **Tinh thần trách nhiệm**: Luôn có trách nhiệm với công việc được giao, hoàn thành đúng thời hạn và đạt chất lượng yêu cầu.

- **Sự chủ động và sáng tạo**: Chủ động đề xuất ý tưởng và giải pháp, không chỉ thực hiện theo hướng dẫn mà còn tìm cách cải tiến và tối ưu hóa.

- **Tinh thần làm việc nhóm**: Sẵn sàng hợp tác, chia sẻ kiến thức và hỗ trợ đồng nghiệp, đóng góp tích cực vào thành công chung của nhóm.

- **Sự kiên trì và kiên nhẫn**: Không nản lòng trước khó khăn, luôn kiên trì tìm hiểu và giải quyết các vấn đề phức tạp.

- **Thái độ cầu thị và tiếp nhận phản hồi**: Luôn sẵn sàng tiếp nhận phản hồi từ người hướng dẫn và đồng nghiệp, coi đó là cơ hội để học hỏi và cải thiện bản thân.

- **Ý thức kỷ luật**: Tuân thủ nội quy và quy định của công ty, đảm bảo thời gian làm việc và tôn trọng văn hóa công ty.

Những kết quả đạt được trong quá trình thực tập không chỉ giúp tôi hoàn thành tốt nhiệm vụ được giao mà còn là nền tảng vững chắc cho sự phát triển nghề nghiệp của tôi trong tương lai.
