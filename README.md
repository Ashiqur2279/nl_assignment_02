# nl_assignment_02

০১. What is PostgreSQL?

PostgreSQL হলো একটি ওপেন সোর্স ডেটাবেইস সিস্টেম, যেখানে আমরা বিভিন্ন ধরনের তথ্য (যেমন নাম, বয়স, সময়, হিসাব, লোকেশন, টাকার পরিমাণ, পরীক্ষার রেজাল্ট ইত্যাদি) সংরক্ষণ করতে পারি। এটি মূলত এমন একটি সফটওয়্যার, যেটা বড় বড় অ্যাপ্লিকেশনের ডেটা ঠিকভাবে সংরক্ষণ করে এবং দরকার হলে সেই ডেটা আবার বের করে এনে ব্যবহার করতে দেয়।

এর সবচেয়ে বড় সুবিধা হলো — এটি ফ্রি, নিরাপদ, এবং অনেক ফিচার দিয়ে কাজ করে। PostgreSQL-এ আমরা SQL ভাষা ব্যবহার করে ডেটা Insert, Update, Delete, এবং Query করতে পারি।

PostgreSQL এর আরও কিছু সুবিধা আছে। যেমন:
১. এটি ফ্রি এবং ওপেন সোর্স, মানে যে কেউ ব্যবহার করতে পারে।
২. এটি বড় পরিমাণ ডেটা খুব সুন্দরভাবে ম্যানেজ করতে পারে।
৩. এতে নিরাপত্তা, একাধিক ইউজার, ট্রানজ্যাকশন, এবং JSON-এর মতো আধুনিক ফিচার আছে।

বড় কোম্পানিগুলো যেমন Amazon, Apple, এবং Instagram-এর ব্যাকএন্ডেও PostgreSQL ব্যবহৃত হয়।

উদাহরণ:
মনে করি, আমাদের কিছু ছাত্রের কিছু তথ্য সংরক্ষণ করে রাখতে হবে। এজন্য আমরা PostgreSQL ব্যবহার করে “students” নামে একটি টেবিল তৈরী করতে পারি যেখানে ছাত্রদের নাম, রোল আর বয়স রাখা হবে।

CREATE TABLE students (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
roll INTEGER NOT NULL,
age INTEGER NOT NULL
);

এইভাবে PostgreSQL আমাদের তথ্য সংরক্ষণে সাহায্য করে।

৩. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key :-
Primary Key হলো এমন এক বা একাধিক নির্দিষ্ট কলাম, যা একটি টেবিলের প্রতিটি রেকর্ড বা রো-কে আলাদাভাবে চিহ্নিত করে। প্রতিটি টেবিলে মাত্র একটি প্রাইমারি কি থাকতে পারে। এটি কখনোই null বা ডুপ্লিকেট হয় না।

ধরি, আমাদের একটি students টেবিল আছে। প্রতিটি ছাত্রের একটি করে ইউনিক আইডি লাগবে, যাতে আমরা একেকজনকে আলাদাভাবে চিহ্নিত করতে পারি। সেই ID কলামটি হবে Primary Key।

CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
name VARCHAR(100),
roll INTEGER NOT NULL,
age INTEGER
);
এখানে student_id হলো প্রাইমারি কি, কারণ এটা প্রতিটি ছাত্রকে আলাদা চিহ্নিত করে।

Foreign Key:-
Foreign Key হলো একটি কলাম, যা অন্য টেবিলের Primary Key-এর সাথে সংযুক্ত থাকে। এর মাধ্যমে দুটি টেবিলের মধ্যে সম্পর্ক (relation) তৈরি হয়। এটি মূলত বলে দেয়, “এই ডেটা ওই টেবিলের ওই রেকর্ডের সাথে সম্পর্কিত।”

মনে করি, students টেবিল আছে আর results নামে আরেকটি টেবিল আছে যেখানে প্রতিটি ছাত্রের রেজাল্ট রাখা হয়। সেই results টেবিলে student_id থাকবে, যেটা students টেবিলের প্রাইমারি কী-এর সাথে যুক্ত থাকবে। তখন student_id হবে ফরেন কী।

CREATE TABLE results (
result_id SERIAL PRIMARY KEY,
student_id INTEGER REFERENCES students(student_id),
score INTEGER NOT NULL
);
এখানে student_id হলো Foreign Key, যেটা students টেবিলের student_id-এর উপর নির্ভর করছে।

৪. What is the difference between the VARCHAR and CHAR data types?
PostgreSQL-এ VARCHAR এবং CHAR দুটি টেক্সট ডেটা সংরক্ষণের জন্য ব্যবহৃত হলেও এদের মধ্যে মূল পার্থক্য হলো সংরক্ষণের পদ্ধতিতে। CHAR(n) হলো একটি ফিক্সড-লেংথ ডেটা টাইপ, অর্থাৎ যদি CHAR(10) ব্যবহার করা হয় এবং সেখানে 'Cat' ইনসার্ট করা হয়, তাহলে ডাটাবেইস অটোমেটিকভাবে বাকি ৭টি স্থানে স্পেস দিয়ে পূরণ করে নেয়। অন্যদিকে, VARCHAR(n) হলো একটি ভ্যারিয়েবল-লেংথ ডেটা টাইপ, যার মানে হলো যতটুকু টেক্সট ইনসার্ট করা হয়, ঠিক ততটুকুই জায়গা নেয়, অতিরিক্ত কোনো স্পেস রাখে না। এই কারণে VARCHAR সাধারণত বেশি জায়গা সাশ্রয় করে এবং বড় ডেটাসেটের ক্ষেত্রে ভালো পারফরম্যান্স দেখা যায়।

CHAR সাধারণত এমন ক্ষেত্রে ব্যবহার করা হয় যেখানে সব ইনপুট একই দৈর্ঘ্যের হয়, যেমন জাতীয় পরিচয়পত্র নম্বর বা কোড। আর VARCHAR বেশি ব্যবহার হয় নাম, ঠিকানা, বর্ণনা ইত্যাদির ক্ষেত্রে যেখানে টেক্সটের দৈর্ঘ্য একরকম থাকে না। যদিও CHAR খুব ছোট ফিক্সড-লেংথ ডেটার ক্ষেত্রে সামান্য দ্রুত হতে পারে, তবুও বাস্তব প্রয়োগে VARCHAR-এর ব্যবহারই বেশি দেখা যায়।

৫. Explain the purpose of the WHERE clause in a SELECT statement.
WHERE ক্লজ হচ্ছে SQL-এর একটি গুরুত্বপূর্ণ অংশ, যার মাধ্যমে আমরা ডেটাবেইস থেকে নির্দিষ্ট শর্ত পূরণ করে এমন রো গুলো বাছাই করা যায়। PostgreSQL-এ যখন আমরা SELECT স্টেটমেন্ট ব্যবহার করি, তখন সেটা পুরো টেবিল থেকে সব রেকর্ড রিটার্ন করতে পারে। কিন্তু সব সময় সব ডেটা দরকার হয় না । অনেক সময় শুধু নির্দিষ্ট কিছু তথ্য দরকার হয় যেগুলো কোনো নির্দিষ্ট শর্ত পূরণ করে। ঠিক সেই কাজটিই WHERE ক্লজ করে দেয়।

উদাহরণস্বরূপ, ধরুন আমাদের একটি "students" টেবিল আছে এবং আমরা শুধু সেই স্টুডেন্টদের দেখতে চাই যাদের বয়স ১৫ এর বেশি। তখন আমরা লিখব:

SELECT \* FROM students WHERE age > 15;
এখানে WHERE age > 15 অংশটি স্টুডেন্টদের তালিকা থেকে শুধু ওই নির্দিষ্ট স্টুডেন্ট বেছে নিচ্ছে। এই ক্লজে আমরা বিভিন্ন ধরনের অপারেটর ব্যবহার করতে পারি, যেমন: =, <, >, BETWEEN, LIKE, IN, এবং IS NULL ইত্যাদি। এর ফলে ডেটা ফিল্টার করা সহজ হয় এবং প্রয়োজনীয় তথ্য দ্রুত পাওয়া যায়, যা কোনো রিপোর্ট তৈরি, ডেটা বিশ্লেষণ, কিংবা অ্যাপ্লিকেশনে ডেটা প্রদর্শনের জন্য খুবই কার্যকর।

৬. What are the LIMIT and OFFSET clauses used for?
LIMIT এবং OFFSET ক্লজগুলি PostgreSQL-এ ডেটা রিটার্ন করার সময় রেকর্ডের সংখ্যা নিয়ন্ত্রণ করতে ব্যবহৃত হয়। যখন কোনো টেবিল থেকে অনেকগুলো রেকর্ড থাকে, তখন সবগুলো রেকর্ড একসঙ্গে দেখতে চাই না—বিশেষ করে যদি ডেটা অনেক বড় হয় তখন LIMIT ও OFFSET সাহায্য করে ডেটার নির্দিষ্ট অংশ বা পেজিংয়ের জন্য।

LIMIT ক্লজ নির্দিষ্ট করে যে কতগুলো রেকর্ড রিটার্ন করতে হবে। উদাহরণস্বরূপ, যদি LIMIT 5 ব্যবহার করা হয়, তাহলে প্রথম ৫টি রেকর্ড দেখা যাবে। আর OFFSET ক্লজ ব্যবহার করে আমরা বলতে পারি, কতগুলো রেকর্ড বাদ দিয়ে ফলাফল শুরু হবে। যেমন, OFFSET 10 মানে প্রথম ১০টি রেকর্ড বাদ দিয়ে ১১তম থেকে শুরু করে রেকর্ডগুলো রিটার্ন করবে।

যদি একসাথে ব্যবহার করি, যেমন:

SELECT \* FROM students LIMIT 5 OFFSET 10;
এর মানে হবে ১১তম থেকে শুরু করে পরবর্তী ৫টি রেকর্ড দেখাও। এই ধরনের পেজিং system ওয়েব অ্যাপ্লিকেশন বা রিপোর্টে খুবই দরকারি, যেখানে ব্যবহারকারী ধাপে ধাপে ডেটা দেখতে পারে।

সুতরাং, LIMIT ও OFFSET ক্লজ ডেটার আকার নিয়ন্ত্রণ এবং ওয়েব অ্যাপলিকেশন এর পারফরম্যান্স ভালো রাখার জন্য অপরিহার্য। কারণ সব ডেটা একসঙ্গে লোড করলে পারফরম্যান্স খারাপ হতে পারে।

০৭. How can you modify data using UPDATE statements?
PostgreSQL-এ ডেটা পরিবর্তনের জন্য `UPDATE` স্টেটমেন্ট ব্যবহার করা হয়। এটি এমন একটি কমান্ড যা টেবিলের রেকর্ডগুলোতে নতুন মান সেট করতে সাহায্য করে। সাধারণত, যখন ডেটাবেজে কোনো তথ্য পরিবর্তন করতে হয় — যেমন কোনো রেকর্ডের নাম, তারিখ, স্ট্যাটাস ইত্যাদি আপডেট করার প্রয়োজন হয় — তখন `UPDATE` ব্যবহার করা হয়।

উদাহরণঃ
UPDATE students
SET name = 'Hero Alom', age = 20;

এখানে, `students` হচ্ছে সেই টেবিল যেখানে পরিবর্তন করতে হবে। `SET` অংশে কোন কলামগুলোতে কি মান দেয়া হবে তা উল্লেখ করা হয়। আর কোনো নির্দিষ্ট রেকর্ড বা রো তে update করতে হলে `WHERE` ক্লজ দিয়ে উক্ত রো নির্দিষ্ট করা হয়। `WHERE` ক্লজ দিয়ে নির্দিষ্ট না করলে টেবিলের সব রেকর্ড পরিবর্তন হয়ে যাবে, যা সাধারণত ঝুঁকিপূর্ণ।

`UPDATE` স্টেটমেন্টের মাধ্যমে আমরা এক বা একাধিক কলাম পরিবর্তন করতে পারি এবং বিভিন্ন শর্তের উপর ভিত্তি করে নির্দিষ্ট রেকর্ডগুলো টার্গেট করতে পারি।

৯. Explain the GROUP BY clause and its role in aggregation operations.
`GROUP BY` ক্লজ হলো SQL-এর একটি গুরুত্বপূর্ণ অংশ যা ডেটাকে নির্দিষ্ট কলাম বা কলামগুলোর ভিত্তিতে গ্রুপ করতে ব্যবহার করা হয়। PostgreSQL-সহ অন্যান্য ডেটাবেজ সিস্টেমে এটি বিশেষভাবে দরকার হয় যখন আমরা ডেটার উপর aggregation function যেমন `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()` ইত্যাদি ব্যবহার করতে চাই।

`GROUP BY` ক্লজের মূল কাজ হলো ডেটার সেটকে ছোট ছোট গ্রুপে ভাগ করা, যেখানে প্রতিটি গ্রুপে থাকা রেকর্ডগুলো নির্দিষ্ট কলামের মান বা ধরণ একই থাকে। এর ফলে, প্রতিটি গ্রুপের জন্য আলাদা আলাদা aggregation ফলাফল পাওয়া যায়।

আমাদের একটি students টেবিল আছে যেখানে বিভিন্ন বয়সের শিক্ষার্থী রয়েছে। যদি আমরা জানতে চাই, কতজন শিক্ষার্থী একই বয়সের, তাহলে আমরা GROUP BY ব্যবহার করে বয়স অনুযায়ী শিক্ষার্থীদের গ্রুপ করতে পারি এবং প্রতিটি বয়সের গ্রুপে কতজন রয়েছে তা গণনা করতে পারি।

SELECT age, COUNT(_) AS total_students
FROM students
GROUP BY age;
এখানে GROUP BY age মানে হলো students টেবিলের রেকর্ডগুলোকে শিক্ষার্থীর বয়স (age) অনুযায়ী গ্রুপ করা হচ্ছে। এরপর COUNT(_) ফাংশন প্রতিটি বয়সের গ্রুপে কতজন শিক্ষার্থী রয়েছে তা গণনা করে দেখায়।

`GROUP BY` ব্যবহার না করলে aggregation ফাংশন পুরো টেবিলের উপর কাজ করবে, আর আমরা প্রতিটি রেঞ্জারের আলাদা তথ্য পাবো না। তাই যখন ডেটাকে ভাগ করে প্রতিটি ভাগের উপরে summary বা aggregated তথ্য বের করতে হয়, তখন `GROUP BY` অপরিহার্য।

সংক্ষেপে, `GROUP BY` ক্লজ ডেটা বিশ্লেষণের ক্ষেত্রে ডেটাকে বিভিন্ন অংশে ভাগ করে নির্দিষ্ট aggregation ফলাফল পেতে সাহায্য করে, যা রিপোর্ট তৈরি, পরিসংখ্যান এবং বিশ্লেষণের জন্য খুবই গুরুত্বপূর্ণ।

১০. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
PostgreSQL-এ aggregate functions যেমন COUNT(), SUM(), এবং AVG() ব্যবহার করে আমরা ডেটার সারাংশ বা সামগ্রিক তথ্য সহজেই বের করতে পারি। এগুলো মূলত টেবিলের অনেক রেকর্ড থেকে নির্দিষ্ট ধরনের সংখ্যামূলক ফলাফল গণনা করে।

প্রথমত, COUNT() ফাংশন ব্যবহার করা হয় কোনো কলামে অথবা পুরো টেবিলে কতটি রেকর্ড আছে তা জানার জন্য। উদাহরণস্বরূপ, যদি আমরা জানতে চাই students টেবিলে মোট কতজন শিক্ষার্থী রয়েছে, তাহলে:

SELECT COUNT(\*) FROM students;
এটি পুরো টেবিলের মোট রেকর্ড সংখ্যা (অর্থাৎ শিক্ষার্থীর সংখ্যা) দেখাবে। আবার, যদি আমরা নির্দিষ্ট কোনো কলামের অনন্য মানের সংখ্যা জানতে চাই — যেমন কতটি ভিন্ন বয়স আছে — তাহলে:

SELECT COUNT(DISTINCT age) FROM students;
দ্বিতীয়ত, SUM() ফাংশন ব্যবহার করা হয় একটি সংখ্যামূলক কলামের মানগুলো যোগ করার জন্য। উদাহরণস্বরূপ, যদি results টেবিলে শিক্ষার্থীদের প্রাপ্ত নম্বর রাখা থাকে score নামক একটি কলামে, তবে মোট নম্বর বের করতে পারি:

SELECT SUM(score) FROM results;
তৃতীয়ত, AVG() ফাংশন ব্যবহার করা হয় কোনো কলামের গড় মান বের করতে। যেমন, শিক্ষার্থীদের গড় বয়স জানতে চাইলে:

SELECT AVG(age) FROM students;
