import UIKit
import RxSwift
import RxCocoa

/// 1. ToArray
/// 각 elements를 하나의 배열에 담는다.
let disposeBag = DisposeBag()

Observable.of(1, 2, 3, 4, 5, 6)
    .toArray()
    .subscribe({
        print($0)
    }).disposed(by: disposeBag)




/// 2. Map
/// 각 elemetns에 어떤 연산을 하고, 해당 연산의 결과를 리턴한다.
//let disposeBag = DisposeBag()
//
//Observable.of(1, 2, 3, 4, 5, 6)
//    .map { return $0 * 2 }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)




/// 3. FlatMap
/// struct와 같은 자료형에서 자료형 전체를 subscribe 하는게 아니라, 특정 멤버에 대해 subscribe 한다.
/// accept() 시, onNext()가 자동으로 호출된다.
//let disposeBag = DisposeBag()
//
//struct Student {
//    var score: BehaviorRelay<Int> // subscribe 가능한 자료형
//}
//
//let Harray = Student(score: BehaviorRelay(value: 90))
//let Jinny = Student(score: BehaviorRelay(value: 70))
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMap() { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//print("--Harray--")
//student.onNext(Harray)
//Harray.score.accept(100)
//print("--Jinny--")
//student.onNext(Jinny)
//Jinny.score.accept(99)
//print("--Harry_again--") // student.onNext(Jinny) 호출 후에도 Harray의 값이 변경되면 onNext() 자동 호출
//Harray.score.accept(95)




/// 4. FlatMapLatest
/// FlatMap과 유사하지만, onNext() 한번의 호출 이후 값이 변경됐을때, onNext()가 자동으로 호출 되지않는다.
//let disposeBag = DisposeBag()
//
//struct Student {
//    var score: BehaviorRelay<Int> // subscribe 가능한 자료형
//}
//
//let Harray = Student(score: BehaviorRelay(value: 90))
//let Jinny = Student(score: BehaviorRelay(value: 70))
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMapLatest() { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//print("--Harry--")
//student.onNext(Harray)
//Harray.score.accept(100)
//
//print("--Jinny--")
//student.onNext(Jinny)
//Jinny.score.accept(99)
//
//print("--Harry_again--")
//Harray.score.accept(0)
