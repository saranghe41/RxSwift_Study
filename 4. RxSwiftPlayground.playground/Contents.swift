import UIKit
import RxSwift


/// 1. StartWith
/// 특정 시퀀스의 맨 첫번째에 element를 추가한다.
let disposeBag = DisposeBag()

let numbers = Observable.of(2, 3, 4)
let observable = numbers.startWith(1)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)



/// 2. Concat
/// 두개 이상의 시퀀스를 하나로 합친다.
/// 순서: first 시퀀스 + second 시퀀스
//let disposeBag = DisposeBag()
//
//let first = Observable.of(1, 2, 3)
//let second = Observable.of(4, 5, 6)
//let observable = Observable.concat([first, second])
//observable.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)



/// 3. Merge
/// 두개 이상의 시퀀스를 하나로 합친다.
/// element의 발생 순서에 따라 순차적으로 발생한다.
//let disposeBag = DisposeBag()
//
//let left = PublishSubject<Int>()
//let right = PublishSubject<Int>()
//
//let source = Observable.of(left.asObserver(), right.asObserver())
//let observable = source.merge()
//observable.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)
//
//left.onNext(5)
//left.onNext(3)
//right.onNext(2)
//right.onNext(1)
//left.onNext(99)



/// 4. CombineLatest
/// 특정 두 시퀀스를 합치는데 두가지 시퀀스 모두에서 최소 하나의 값이 들어왔을 때 가장 최신의 값을 가져오는 것이다.
//let left = PublishSubject<Int>()
//let right = PublishSubject<Int>()
//
//let observable = Observable.combineLatest(left, right, resultSelector: {
//    lastLeft, lastRight in
//    "\(lastLeft) \(lastRight)" // Observable 타입
//})
//
//let disposable = observable.subscribe(onNext: { value in
//    print(value)
//})
//
//left.onNext(45)
//right.onNext(1)
//left.onNext(30)
//right.onNext(99)
//right.onNext(2)



/// 5. WithLatestFrom
/// button.withLatestFrom(textFlied)일때, button 클릭 시 textField에 최종 입력된 글자가 출력된다.
//let button = PublishSubject<Void>()
//let textField = PublishSubject<String>()
//
//let observable = button.withLatestFrom(textField)
//let disposable = observable.subscribe(onNext: {
//    print($0)
//})
//
//textField.onNext("Sw")
//textField.onNext("Swif")
//textField.onNext("Swift")
//textField.onNext("Swift Rocks!")
//
//button.onNext(()) // button Click!
//button.onNext(())



/// 6. Reduce
/// 초기값, 연산자(+, -, /, %, *) 두가지 인자를 받는다.
/// 초기값에 elemnet들을 연산하여 결과를 출력한다.
//let disposeBag = DisposeBag()
//
//let source = Observable.of(1, 2, 3)
//source.reduce(0, accumulator: +)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//// 연산자를 clouser{}로 식을 만들어 사용할 수 있다.
//// 연산자 +와 같은 결과
//source.reduce(0, accumulator: {
//    summary, newValue in // summary: 여태 계산된 값, newValue: 각 요소
//    return summary + newValue
//}).subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)




/// 7. Scan
/// Reduce와 거의 동일하다.
/// 결과만 리턴하는 Reduce와 달리 Scan은 모든 과정을 전부 리턴한다.
//let disposeBag = DisposeBag()
//
//let source = Observable.of(1, 2, 3, 5, 6)
//source.scan(0, accumulator: +)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
