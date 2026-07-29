import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaritySurfaceTensionPackage where
  interfaceCurvature : Prop
  surfaceTensionCoefficient : Prop
  youngLaplaceEquation : Prop
  dynamicBoundaryCondition : Prop
  jumpConditionAcrossInterface : Prop

structure CapillaritySurfaceTensionEvidence (C : CapillaritySurfaceTensionPackage) where
  interfaceCurvatureClosed : C.interfaceCurvature
  surfaceTensionCoefficientClosed : C.surfaceTensionCoefficient
  youngLaplaceEquationClosed : C.youngLaplaceEquation
  dynamicBoundaryConditionClosed : C.dynamicBoundaryCondition
  jumpConditionAcrossInterfaceClosed : C.jumpConditionAcrossInterface

def CapillaritySurfaceTensionClosed (C : CapillaritySurfaceTensionPackage) : Prop :=
  C.interfaceCurvature ∧ C.surfaceTensionCoefficient ∧
  C.youngLaplaceEquation ∧ C.dynamicBoundaryCondition ∧
  C.jumpConditionAcrossInterface

theorem capillarity_surface_tension_closed_from_evidence
    (C : CapillaritySurfaceTensionPackage) (E : CapillaritySurfaceTensionEvidence C) :
    CapillaritySurfaceTensionClosed C := by
  exact And.intro E.interfaceCurvatureClosed
    (And.intro E.surfaceTensionCoefficientClosed
      (And.intro E.youngLaplaceEquationClosed
        (And.intro E.dynamicBoundaryConditionClosed
          E.jumpConditionAcrossInterfaceClosed)))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse