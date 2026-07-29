import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionIncompressiblePDEPackage where
  surfaceTensionField : Type u
  velocityField : Type v
  pressureField : Type w
  densityConstant : ℝ
  viscosityConstant : ℝ
  incompressibleNavierStokesEquations : Prop
  surfaceTensionForceModel : Prop
  interfaceAdhesionLaw : Prop

structure SurfaceTensionIncompressiblePDEEvidence (S : SurfaceTensionIncompressiblePDEPackage) where
  incompressibleNavierStokesEquationsClosed : S.incompressibleNavierStokesEquations
  surfaceTensionForceModelClosed : S.surfaceTensionForceModel
  interfaceAdhesionLawClosed : S.interfaceAdhesionLaw

def SurfaceTensionIncompressiblePDEClosed (S : SurfaceTensionIncompressiblePDEPackage) : Prop :=
  S.incompressibleNavierStokesEquations ∧ S.surfaceTensionForceModel ∧ S.interfaceAdhesionLaw

theorem surface_tension_incompressible_pde_closed_from_evidence
    (S : SurfaceTensionIncompressiblePDEPackage) (E : SurfaceTensionIncompressiblePDEEvidence S) :
    SurfaceTensionIncompressiblePDEClosed S := by
  exact And.intro E.incompressibleNavierStokesEquationsClosed
    (And.intro E.surfaceTensionForceModelClosed E.interfaceAdhesionLawClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
